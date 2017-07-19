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
    def progress_bar(iteration, total, prefix='Progress:', suffix='Complete', decimals=1, length=100, fill='#'):
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
        percent = ("{0:." + str(decimals) + "f}").format(100 * (iteration / float(total)))
        filled_length = int(length * iteration // total)
        bar = fill * filled_length + '-' * (length - filled_length)

        out = '\r%s |%s| %s%% %s' % (prefix, bar, percent, suffix)
        logging.info(out)

    def __init__(self, bouding_box, raster, server="localhost", dbname="eba", user="eba", password="ebaeba18"):
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

        self._fields = ('min', 'mean', 'max', 'std', 'sum', 'count', 'area')
        logging.info("Fields that will be created: {}".format(str(self._fields)))

        srs = self._bb.GetSpatialRef()
        geom_type = self._bb_defn.GetGeomType()
        gdal_options = ['OVERWRITE=YES']

        logging.info("Trying to create table: {}, {}, {}".format(self._raster_filename, str(geom_type),
                                                                 str(gdal_options)))
        logging.info("With projection: {}".format(str(srs)))

        self._newbb = self._conn.CreateLayer(self._raster_filename, srs, geom_type, gdal_options)
        self._newbb_defn = self._newbb.GetLayerDefn()

        self._band = self._raster_ds.GetRasterBand(1)
        self._geo_trans = self._raster_ds.GetGeoTransform()

        self._mem_drv = ogr.GetDriverByName('Memory')
        self._mem_gdal_driver = gdal.GetDriverByName('MEM')

    def close(self):
        del self._bb
        del self._raster_ds
        del self._conn

    def extract(self, nodata_value=None, global_src_extent=False):
        self.__create_fields_df()
        logging.info("Copying '{}' fields to '{}'".format(self._newbb_defn.GetFieldCount(), self._raster_filename))

        if nodata_value:
            nodata_value = float(nodata_value)
            self._band.SetNoDataValue(nodata_value)
        else:
            nodata_value = self._band.GetNoDataValue()

        transaction_cont = 0
        progress_cont = 0
        progress_total = int(self._bb.GetFeatureCount())
        ZonalStats.progress_bar(progress_cont, progress_total)

        feat = self._bb.GetNextFeature()
        while feat:
            geometry = feat.geometry()
            src_offset, src_array, new_gt = self.offset_values(geometry, global_src_extent)
            if src_array.any():
                try:
                    if transaction_cont == 0:
                        self._newbb.StartTransaction()

                    self.zonal_stats(feat, geometry, nodata_value, src_offset, src_array, new_gt)

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

    def offset_values(self, geometry, global_src_extent):
        """
        # Use global source extent
        create an in-memory numpy array of the source raster data
        covering the whole extent of the vector layer
        useful only when disk IO or raster scanning inefficiencies are your limiting factor
        advantage: reads raster data in one pass
        disadvantage: large vector extents may have big memory requirements

        # Use local source extent
        fastest option when you have fast disks and well indexed raster (ie tiled Geotiff)
        advantage: each feature uses the smallest raster chunk
        disadvantage: lots of reads on the source raster

        :param global_src_extent: A boolean
        :return: src_offset, src_array, new_gt
        """
        if global_src_extent:
            src_offset = self.__bbox_to_pixel_offsets(self._geo_trans, self._bb.GetExtent())

        else:
            src_offset = self.__bbox_to_pixel_offsets(self._geo_trans, geometry.GetEnvelope())

        src_array = np.array(self._band.ReadAsArray(*src_offset))
        new_gt = (
            (self._geo_trans[0] + (src_offset[0] * self._geo_trans[1])),
            self._geo_trans[1],
            0.0,
            (self._geo_trans[3] + (src_offset[1] * self._geo_trans[5])),
            0.0,
            self._geo_trans[5]
        )

        return src_offset, src_array, new_gt

    def zonal_stats(self, feat, geometry, nodata_value, src_offset, src_array, new_gt):
        mem_ds = self._mem_drv.CreateDataSource('out')
        mem_layer = mem_ds.CreateLayer('poly', None, ogr.wkbPolygon)
        mem_layer.CreateFeature(feat.Clone())

        rvds = self._mem_gdal_driver.Create('', src_offset[2], src_offset[3], 1, gdal.GDT_Byte)
        rvds.SetGeoTransform(new_gt)

        gdal.RasterizeLayer(rvds, [1], mem_layer, burn_values=[1])
        rv_array = rvds.ReadAsArray()

        masked = np.ma.MaskedArray(
            src_array,
            mask=np.logical_or(
                src_array == nodata_value,
                np.logical_not(rv_array)
            )
        )

        feature_stats = {self._fields[6]: float(geometry.Area())}

        try:
            masked_stats = {
                self._fields[0]: float(masked.min()),
                self._fields[1]: float(masked.mean()),
                self._fields[2]: float(masked.max()),
                self._fields[3]: float(masked.std()),
                self._fields[4]: float(masked.sum()),
                self._fields[5]: int(masked.count()),
            }

            feature_stats.update(masked_stats)
        except Exception as masked_error:
            logging.error("Error to np.ma.MaskedArray: {}".format(str(masked_error)))

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
        del rvds
        del mem_ds

    def list_layers(self):
        layers = []
        for layer in self._conn:
            layer_name = layer.GetName()
            if layer_name not in layers:
                layers.append(layer_name)
        layers.sort()
        return layers

    def __create_fields_df(self):
        for i in range(0, self._bb_defn.GetFieldCount()):
            field_defn = self._bb_defn.GetFieldDefn(i)
            self._newbb.CreateField(field_defn)

        int_field = "count"
        for field_name in self._fields:
            field_type = ogr.OFTReal
            if int_field in field_name:
                field_type = ogr.OFTInteger
            field = ogr.FieldDefn(field_name, field_type)
            self._newbb.CreateField(field)

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
    parser.add_argument("-g", "--globalextent", type=bool, default=False, help="Create an in-memory numpy array of the "
                                                                               "source raster data. Default False.")
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
        zs.extract(args.nodata, args.globalextent)
        zs.close()

        tf_sec = int((time.clock() - ti) % 60)
        tf_min = int((tf_sec / 60) % 60)
        tf_h = int((tf_min / 60) % 24)
        logging.info("Table created with success in {} hours {} minutes {} seconds!".format(tf_h, tf_min, tf_sec))
    except Exception as e:
        logging.error("Error to process '{}' and '{}': {}".format(args.vectorpath, args.rasterpath, str(e)))
