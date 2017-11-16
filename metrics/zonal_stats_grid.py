"""
Zonal Statistics
Vector-Raster Analysis

Reference: Matthew Perry (https://gist.githubusercontent.com/perrygeo/5667173/raw/763e1e50208e8c853f46e57cd07bb07b424fed10/zonal_stats.py)

Copyright 2017 Heitor G. Carneiro

Usage:
  zonal_stats.py -v "<VECTOR>" -r "<RASTER>"
  zonal_stats.py -h | --help
  zonal_stats.py --version

Options:
  -h --help     Show this screen.
  --version     Show version.
"""
import argparse
import logging
import os
import time
import traceback

import numpy as np
from osgeo import gdal, ogr
from osgeo.gdalconst import *

gdal.PushErrorHandler('CPLQuietErrorHandler')


class ZonalStats(object):
    @staticmethod
    def cmd_header():
        return "Zonal Statistics\n" \
               "Vector-Raster Analysis\n" \
               "Reference: Matthew Perry " \
               "(https://gist.githubusercontent.com/perrygeo/5667173/raw/763e1e50208e8c853f46e57cd07bb07b424fed10/zonal_stats.py)\n" \
               "Copyright 2017 Heitor G. Carneiro"

    @staticmethod
    def progress_bar(iteration, total, previous=0.0, prefix='Progress:', suffix='Complete', decimals=1, length=50,
                     fill='#'):
        """
        Call in a loop to create terminal progress bar
        @params:
            iteration   - Required  : current iteration (Int)
            total       - Required  : total iterations (Int)
            previous    - Optional  : previous progress (Float)
            prefix      - Optional  : prefix string (Str)
            suffix      - Optional  : suffix string (Str)
            decimals    - Optional  : positive number of decimals in percent complete (Int)
            length      - Optional  : character length of bar (Int)
            fill        - Optional  : bar fill character (Str)
        """
        progress = 100 * (iteration / float(total))
        if round(progress, 1) != round(previous, 1):
            percent = ("{0:." + str(decimals) + "f}").format(progress)
            filled_length = int(length * iteration // total)
            bar = fill * filled_length + '-' * (length - filled_length)

            out = '%s |%s| %s%% %s' % (prefix, bar, percent, suffix)
            logging.info(out)
        return progress

    def load_rasters(self, nodata_value, valid_ext=".tif"):
        rasters = {}
        for filename in os.listdir(self._raster_path):
            filepath = os.path.join(self._raster_path, filename)
            basename, ext = os.path.splitext(filename)
            if os.path.isfile(filepath) and ext == valid_ext:
                logging.info("Loading raster: {}".format(basename))

                try:
                    ds = gdal.Open(filepath, GA_ReadOnly)
                    assert ds

                    band = ds.GetRasterBand(1)
                    assert band

                    gt = ds.GetGeoTransform()
                    assert gt

                    nodata = nodata_value or band.GetNoDataValue()
                    assert nodata

                    rasters[basename.lower()] = {
                        'ds': ds,
                        'band': band,
                        'gt': gt,
                        'nodata': nodata
                    }
                except Exception as load_error:
                    logging.error("Error to load raster '{}': {}\n{}\n".format(basename, load_error, traceback.format_exc()))
        return rasters

    def __init__(self, bouding_box, raster, nodata_value=None, statement=None, server="localhost", dbname="eba", user="eba",
                 password="ebaeba18"):
        conn_str = "PG: host=%s dbname=%s user=%s password=%s" % (server, dbname, user, password)

        logging.info("Trying to connect PostgresSQL database: {}".format(conn_str))
        conn = ogr.Open(conn_str)
        assert conn

        if statement:
            logging.info("Querying data source and read in the extent ({})".format(statement))
            bb = conn.ExecuteSQL(statement)
        else:
            logging.info("Loading boundig box: {}".format(bouding_box))
            bb = conn.GetLayer(bouding_box)
        assert bb

        assert os.path.isdir(raster)

        self._conn = conn
        self._bb = bb
        self._bb_defn = self._bb.GetLayerDefn()
        self._raster_path = raster
        self._rasters = self.load_rasters(nodata_value)

        self._fields = sorted(self._rasters.keys())
        logging.info("Fields that will be created: {}".format(str(self._fields)))

        srs = self._bb.GetSpatialRef()
        geom_type = self._bb_defn.GetGeomType()
        gdal_options = ['OVERWRITE=YES']

        self._table = "{}_{}".format(bouding_box, time.strftime("%Y%m%d_%H%M%S"))
        logging.info("Trying to create table: {}, {}, {}".format(self._table, str(geom_type), str(gdal_options)))
        logging.info("With projection: {}".format(str(srs)))

        self._newbb = self._conn.CreateLayer(self._table, srs, geom_type, gdal_options)
        self.__create_fields_df()
        self._newbb_defn = self._newbb.GetLayerDefn()

        self._mem_drv = ogr.GetDriverByName('Memory')
        self._mem_ogr_driver = gdal.GetDriverByName('MEM')

    def close(self):
        del self._bb
        del self._rasters
        del self._conn

    def extract(self):
        logging.info("Copying '{}' fields to '{}'".format(self._newbb_defn.GetFieldCount(), self._table))

        transaction_cont = 0
        progress_cont = 0
        progress_total = self._bb.GetFeatureCount()
        progress_previous = ZonalStats.progress_bar(progress_cont, progress_total)

        feat = self._bb.GetNextFeature()
        while feat:
            geometry = feat.geometry()
            if transaction_cont == 0:
                self._newbb.StartTransaction()

            feature_stats = self.__raster_stats(feat, geometry)
            self.__add_feature(feat, geometry, feature_stats)

            if transaction_cont == 1000:
                self._newbb.CommitTransaction()
                transaction_cont = 0

            feat = self._bb.GetNextFeature()
            transaction_cont += 1
            progress_cont += 1
            progress_previous = ZonalStats.progress_bar(progress_cont, progress_total, progress_previous)

        if transaction_cont > 0:
            logging.info("Closing transaction with {} records".format(transaction_cont))
            self._newbb.CommitTransaction()
        del transaction_cont
        del progress_cont
        del progress_previous
        del progress_total

    def __raster_stats(self, feat, geometry):
        mem_ds = self._mem_drv.CreateDataSource('out')

        feature_stats = {}
        for field, raster in self._rasters.items():
            band = raster['band']
            raster_gt = raster['gt']
            src_array, src_offset = self.__offset_values(band, raster_gt, geometry)
            if src_array.any():
                new_gt = self.__geo_transform(raster_gt, src_offset)
                nodata = raster['nodata']
                mean = self.__mean(feat, mem_ds, field, src_array, src_offset, new_gt, nodata)
            else:
                logging.error(
                    "Array({}) of bouding box with FID {} is None. Reading next feature".format(field, feat.GetFID()))
                mean = None
            feature_stats[field] = mean
        del mem_ds
        return feature_stats

    def __mean(self, feat, mem_ds, field, src_array, src_offset, new_gt, nodata_value):
        mem_layer = mem_ds.CreateLayer(field, None, ogr.wkbPolygon)
        mem_layer.CreateFeature(feat.Clone())

        rvds = self._mem_ogr_driver.Create('', src_offset[2], src_offset[3], 1, gdal.GDT_Byte)
        rvds.SetGeoTransform(new_gt)

        gdal.RasterizeLayer(rvds, [1], mem_layer, burn_values=[1])
        try:
            masked = np.ma.MaskedArray(
                src_array,
                mask=np.logical_or(
                    src_array == nodata_value,
                    np.logical_not(rvds.ReadAsArray())
                )
            )

            mean = float(masked.mean())
        except Exception as masked_error:
            logging.error("Error to extract zonal stats({}): {}".format(field, str(masked_error)))
            mean = None

        del rvds
        return mean

    def __add_feature(self, feat, geometry, feature_stats):
        new_feature = ogr.Feature(self._newbb_defn)
        new_feature.SetGeometry(geometry)
        for i in range(0, self._newbb_defn.GetFieldCount()):
            name_ref = self._newbb_defn.GetFieldDefn(i).GetNameRef()
            if name_ref in feature_stats:
                field_value = feature_stats[name_ref]
            else:
                field_value = feat.GetField(i)
            new_feature.SetField(name_ref, field_value)
        self._newbb.CreateFeature(new_feature)
        del new_feature

    def __offset_values(self, band, raster_gt, geometry):
        src_offset = self.__bbox_to_pixel_offsets(raster_gt, geometry.GetEnvelope())
        src_array = self.__band_as_array(band, src_offset)
        return src_array, src_offset

    def __create_fields_df(self, field_type=ogr.OFTReal):
        for i in range(0, self._bb_defn.GetFieldCount()):
            field_defn = self._bb_defn.GetFieldDefn(i)
            self._newbb.CreateField(field_defn)

        for field_name in self._fields:
            self._newbb.CreateField(ogr.FieldDefn(field_name, field_type))

    def __geo_transform(self, raster_gt, src_offset):
        new_gt = (
            (raster_gt[0] + (src_offset[0] * raster_gt[1])),
            raster_gt[1],
            0.0,
            (raster_gt[3] + (src_offset[1] * raster_gt[5])),
            0.0,
            raster_gt[5]
        )
        return new_gt

    def __band_as_array(self, band, src_offset):
        return np.array(band.ReadAsArray(*src_offset))

    def __bbox_to_pixel_offsets(self, gt, bbox):
        originX = gt[0]
        originY = gt[3]
        pixel_width = gt[1]
        pixel_height = gt[5]
        x1 = int((bbox[0] - originX) / pixel_width)
        x2 = int((bbox[1] - originX) / pixel_width) + 1

        y1 = int((bbox[3] - originY) / pixel_height)
        y2 = int((bbox[2] - originY) / pixel_height) + 1

        xsize = x2 - x1
        ysize = y2 - y1
        return (x1, y1, xsize, ysize)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=ZonalStats.cmd_header())
    parser.add_argument("-v", "--vectorpath", type=str, required=True, help="Vector table.")
    parser.add_argument("-r", "--rasterpath", type=str, required=True, help="Raster file.")
    parser.add_argument("-n", "--nodata", type=float, default=None, help="No data value. Default None.")
    parser.add_argument("-s", "--statement", type=str, default=None, help="SQL. Default None.")
    parser.add_argument("-l", "--log", type=str, default=None, help="Logs to a file. Default 'console'.")
    args = parser.parse_args()

    if args.log:
        logging.basicConfig(filename=args.log, level=logging.INFO)
        logging.getLogger().addHandler(logging.StreamHandler())
    else:
        logging.basicConfig(level=logging.INFO)

    try:
        logging.info("Running 'zonal_stats_grid' to '{}' and '{}'...".format(args.vectorpath, args.rasterpath))
        ti = time.clock()

        zs = ZonalStats(args.vectorpath, args.rasterpath, args.nodata, args.statement)
        zs.extract()
        zs.close()

        tf_sec = int((time.clock() - ti) % 60)
        tf_min = int((tf_sec / 60) % 60)
        tf_h = int((tf_min / 60) % 24)
        logging.info("Table created with success in {} hours {} minutes {} seconds!".format(tf_h, tf_min, tf_sec))
    except Exception as e:
        logging.error("Error to process '{}' and '{}': {}\n{}\n".format(args.vectorpath, args.rasterpath, str(e), traceback.format_exc()))
