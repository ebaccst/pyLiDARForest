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
    def progress_bar(iteration, total, prefix='Progress:', suffix='Complete', length=50, fill='#', step=10):
        """
        Call in a loop to create terminal progress bar
        @params:
            iteration   - Required  : current iteration (Int)
            total       - Required  : total iterations (Int)
            prefix      - Optional  : prefix string (Str)
            suffix      - Optional  : suffix string (Str)
            decimals    - Optional  : positive number of decimals in percent complete (Int)
            length      - Optional  : character length of bar (Int)
            fill        - Optional  : bar fill character (Str)
        """
        percent = round(100 * (iteration / float(total)))
        if percent % step == 0:
            filled_length = int(length * iteration // total)
            bar = fill * filled_length + '-' * (length - filled_length)
            out = '\r%s |%s| %.1f%% %s' % (prefix, bar, percent, suffix)
            logging.info(out)

    def __init__(self, bouding_box, raster, server="localhost", dbname="eba", user="eba",
                 password="ebaeba18"):
        conn_str = "PG: host=%s dbname=%s user=%s password=%s" % (server, dbname, user, password)

        logging.info("Trying to connect PostgresSQL database: {}".format(conn_str))
        conn = ogr.Open(conn_str)
        assert conn

        logging.info("Loading boundig box: {}".format(bouding_box))
        bb = conn.GetLayer(bouding_box)
        assert bb

        logging.info("Loading raster: {}".format(raster))
        rds = gdal.Open(raster, GA_ReadOnly)
        assert rds

        self._conn = conn
        self._bb = bb
        self._raster_ds = rds
        self._bb_defn = self._bb.GetLayerDefn()
        self._raster_filename = os.path.splitext(os.path.basename(raster))[0].lower()

        self._field_name = "mean"
        logging.info("Fields that will be created: {}".format(self._field_name))

        srs = self._bb.GetSpatialRef()
        geom_type = self._bb_defn.GetGeomType()
        gdal_options = ['OVERWRITE=YES']

        logging.info("Trying to create table: {}, {}, {}".format(self._raster_filename, str(geom_type),
                                                                 str(gdal_options)))
        logging.info("With projection: {}".format(str(srs)))

        self._newbb = self._conn.CreateLayer(self._raster_filename, srs, geom_type, gdal_options)
        self._newbb_defn = self._newbb.GetLayerDefn()

        self._band = self._raster_ds.GetRasterBand(1)
        self._raster_gt = self._raster_ds.GetGeoTransform()

        self._mem_drv = ogr.GetDriverByName('Memory')
        self._mem_ogr_driver = gdal.GetDriverByName('MEM')

    def close(self):
        del self._bb
        del self._raster_ds
        del self._conn

    def extract(self, nodata_value=None):
        logging.info("Copying '{}' fields to '{}'".format(self._newbb_defn.GetFieldCount(), self._raster_filename))
        self.__create_fields_df()

        if nodata_value:
            nodata_value = float(nodata_value)
            self._band.SetNoDataValue(nodata_value)
        else:
            nodata_value = self._band.GetNoDataValue()

        transaction_cont = 0
        progress_cont = 0
        progress_total = self._bb.GetFeatureCount()
        ZonalStats.progress_bar(progress_cont, progress_total)

        feat = self._bb.GetNextFeature()
        while feat:
            geometry = feat.geometry()
            src_offset = self.__bbox_to_pixel_offsets(self._raster_gt, geometry.GetEnvelope())
            src_array = self.__band_as_array(src_offset)
            if src_array.any():
                try:
                    if transaction_cont == 0:
                        self._newbb.StartTransaction()

                    new_gt = self.__geo_transform(src_offset)
                    mem_ds = self._mem_drv.CreateDataSource('out')
                    mem_layer = mem_ds.CreateLayer('poly', None, ogr.wkbPolygon)
                    mem_layer.CreateFeature(feat.Clone())

                    rvds = self._mem_ogr_driver.Create('', src_offset[2], src_offset[3], 1, gdal.GDT_Byte)
                    rvds.SetGeoTransform(new_gt)

                    gdal.RasterizeLayer(rvds, [1], mem_layer, burn_values=[1])
                    masked = np.ma.MaskedArray(
                        src_array,
                        mask=np.logical_or(
                            src_array == nodata_value,
                            np.logical_not(rvds.ReadAsArray())
                        )
                    )

                    self.__add_feature(feat, geometry, float(masked.mean()))
                    del rvds
                    del mem_ds

                    if transaction_cont == 1000:
                        self._newbb.CommitTransaction()
                        transaction_cont = 0
                    transaction_cont += 1
                except Exception as zs_error:
                    logging.error("Error to extract zonal stats: {}".format(str(zs_error)))
            else:
                logging.error("Array of bounding box (FID: {}) is None. Reading next feature".format(feat.GetFID()))

            feat = self._bb.GetNextFeature()
            progress_cont += 1
            ZonalStats.progress_bar(progress_cont, progress_total)

        if transaction_cont > 0:
            logging.info("Closing transaction with {} records".format(transaction_cont))
            self._newbb.CommitTransaction()
        del transaction_cont
        del progress_cont
        del progress_total

    def __add_feature(self, feat, geometry, feat_value):
        new_feature = ogr.Feature(self._newbb_defn)
        new_feature.SetGeometry(geometry)
        for i in range(0, self._newbb_defn.GetFieldCount()):
            name_ref = self._newbb_defn.GetFieldDefn(i).GetNameRef()
            if name_ref == self._field_name:
                field_value = feat_value
            else:
                field_value = feat.GetField(i)
            new_feature.SetField(name_ref, field_value)
        self._newbb.CreateFeature(new_feature)
        del new_feature

    def __create_fields_df(self, field_type=ogr.OFTReal):
        for i in range(0, self._bb_defn.GetFieldCount()):
            field_defn = self._bb_defn.GetFieldDefn(i)
            self._newbb.CreateField(field_defn)
        self._newbb.CreateField(ogr.FieldDefn(self._field_name, field_type))

    def __geo_transform(self, src_offset):
        new_gt = (
            (self._raster_gt[0] + (src_offset[0] * self._raster_gt[1])),
            self._raster_gt[1],
            0.0,
            (self._raster_gt[3] + (src_offset[1] * self._raster_gt[5])),
            0.0,
            self._raster_gt[5]
        )
        return new_gt

    def __band_as_array(self, src_offset):
        return np.array(self._band.ReadAsArray(*src_offset))

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

        zs = ZonalStats(args.vectorpath, args.rasterpath)
        zs.extract(args.nodata)
        zs.close()

        tf_sec = int((time.clock() - ti) % 60)
        tf_min = int((tf_sec / 60) % 60)
        tf_h = int((tf_min / 60) % 24)
        logging.info("Table created with success in {} hours {} minutes {} seconds!".format(tf_h, tf_min, tf_sec))
    except Exception as e:
        logging.error("Error to process '{}' and '{}': {}".format(args.vectorpath, args.rasterpath, str(e)))
