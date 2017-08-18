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

import numpy as np
from osgeo import gdal, ogr
from osgeo.gdalconst import *
from time import time

from dbutils import dbutils

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

    def __init__(self, bouding_box, table, raster, nodata_value=None, server="localhost", dbname="eba", user="eba",
                 password="ebaeba18", tablespace="pg_default"):
        db = dbutils(server, user, password, dbname, tablespace)
        assert db

        conn_str = "PG: host=%s dbname=%s user=%s password=%s" % (server, dbname, user, password)

        logging.info("Trying to connect PostgresSQL database: {}".format(conn_str))
        conn = ogr.Open(conn_str)
        assert conn

        logging.info("Loading boundig box: {}".format(bouding_box))
        bb = conn.GetLayer(bouding_box)
        assert bb

        logging.info("Loading table to insert data: {}".format(table))
        newbb = conn.GetLayer(table)
        assert newbb
        assert os.path.isdir(raster)

        newbb_defn = newbb.GetLayerDefn()
        self._geom_column = newbb.GetGeometryColumn()
        self._fields = self.__names_reference(newbb_defn)

        self._db = db
        self._conn = conn
        self._tablename = table

        self._bb = bb
        self._bb_defn = self._bb.GetLayerDefn()

        self._raster_path = raster
        self._rasters = self.__load_rasters(nodata_value)

        srs = self._bb.GetSpatialRef()
        srs.AutoIdentifyEPSG()

        partial_node = "PROJCS"
        self._newbb_authority_name = srs.GetAuthorityName(partial_node)
        self._newbb_authority_code = srs.GetAuthorityCode(partial_node)

        self._mem_drv = ogr.GetDriverByName('Memory')
        self._mem_ogr_driver = gdal.GetDriverByName('MEM')

    def close(self):
        del self._bb
        del self._rasters
        del self._conn

    def extract_parallel(self, startswith, endswith):
        startswith = float(startswith)
        endswith = float(endswith)
        logging.info("Copying '{}' fields to '{}'".format(self._bb_defn.GetFieldCount(), self._tablename))

        transaction_cont = 0
        progress_cont = 0.0
        progress_total = endswith - startswith
        progress_previous = ZonalStats.progress_bar(progress_cont, progress_total)

        self._bb.SetNextByIndex(startswith)
        feat = self._bb.GetNextFeature()
        while feat and startswith < endswith:
            if transaction_cont == 0:
                self.__begin_transaction()

            self.__insert_row(self.__data(feat))

            if transaction_cont == 1000:
                self.__commit_transaction()
                transaction_cont = 0

            transaction_cont += 1
            progress_cont += 1
            progress_previous = ZonalStats.progress_bar(progress_cont, progress_total, progress_previous)

            startswith += 1
            feat = self._bb.GetNextFeature()

        if transaction_cont > 0:
            logging.info("Closing transaction with {} records".format(transaction_cont))
            self.__commit_transaction()
        del transaction_cont
        del progress_cont
        del progress_previous
        del startswith
        del endswith
        del progress_total

    def __data(self, feat, nullvalue="NULL"):
        geometry = feat.geometry()
        values = self.__raster_stats(feat, geometry)

        for i in range(0, self._bb_defn.GetFieldCount()):
            name_ref = self._bb_defn.GetFieldDefn(i).GetNameRef()
            field_value = feat.GetField(i)
            if not field_value:
                field_value = nullvalue
            values[name_ref] = str(field_value)
        values[self._geom_column] = self.__geom_from_wkt(geometry.ExportToWkt())
        return values

    def __raster_stats(self, feat, geometry):
        mem_ds = self._mem_drv.CreateDataSource('out')
        mean = "NULL"

        feature_stats = {}
        for field, raster in self._rasters.items():
            band = raster['band']
            raster_gt = raster['gt']
            src_array, src_offset = self.__offset_values(band, raster_gt, geometry)
            if src_array.any():
                new_gt = self.__geo_transform(raster_gt, src_offset)
                nodata = raster['nodata']
                value = str(self.__mean(feat, mem_ds, field, src_array, src_offset, new_gt, nodata))
                if value != "nan":
                    mean = value
            else:
                logging.error(
                    "Array({}) of bouding box with FID {} is None. Reading next feature".format(field, feat.GetFID()))
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

    def __insert_row(self, data):
        sql = "INSERT INTO {}({}) VALUES({});"
        args = ",".join(self._fields)
        values = ",".join([data[field] for field in self._fields])
        return self._db.execute(sql.format(self._tablename, args, values))

    def __offset_values(self, band, raster_gt, geometry):
        src_offset = self.__bbox_to_pixel_offsets(raster_gt, geometry.GetEnvelope())
        src_array = self.__band_as_array(band, src_offset)
        return src_array, src_offset

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

    def __load_rasters(self, nodata_value, valid_ext=".tif"):
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
                    logging.error("Error to load raster '{}': {}".format(basename, str(load_error)))
        return rasters

    def __names_reference(self, table_defn):
        names = [table_defn.GetFieldDefn(i).GetNameRef() for i in range(0, table_defn.GetFieldCount())]
        names.append(self._geom_column)
        return names

    def __geom_from_wkt(self, geom):
        return "ST_GeomFromText('{}', {})".format(geom, self._newbb_authority_code)

    def __begin_transaction(self):
        self._db.execute("BEGIN")

    def __commit_transaction(self):
        self._db.execute("COMMIT")

    def __rollback_transaction(self):
        self._db.execute("ROLLBACK")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=ZonalStats.cmd_header())
    parser.add_argument("-b", "--boundingbox", type=str, required=True, help="Base vector table.")
    parser.add_argument("-t", "--table", type=str, required=True, help="New vector table.")
    parser.add_argument("-r", "--rasterpath", type=str, required=True, help="Raster file.")
    parser.add_argument("-s", "--starswith", type=float, required=True, help="Initial feature identifier.")
    parser.add_argument("-e", "--endswith", type=float, required=True, help="Final feature identifier.")
    parser.add_argument("-n", "--nodata", type=float, default=None, help="No data value. Default None.")
    parser.add_argument("-l", "--log", type=str, default=None, help="Logs to a file. Default 'console'.")
    args = parser.parse_args()

    if args.log:
        logging.basicConfig(filename=args.log, level=logging.INFO)
        logging.getLogger().addHandler(logging.StreamHandler())
    else:
        logging.basicConfig(level=logging.INFO)

    try:
        logging.info("Running 'zonal_stats_grid' to '{}' and '{}'...".format(args.boundingbox, args.rasterpath))
        ti = time()

        zs = ZonalStats(args.boundingbox, args.table, args.rasterpath, args.nodata)
        zs.extract_parallel(args.starswith, args.endswith)
        zs.close()

        tf_sec = int((time() - ti) % 60)
        tf_min = int((tf_sec / 60) % 60)
        tf_h = int((tf_min / 60) % 24)
        logging.info("Table created with success in {} hours {} minutes {} seconds!".format(tf_h, tf_min, tf_sec))
    except Exception as e:
        logging.error("Error to process '{}' and '{}': {}".format(args.boundingbox, args.rasterpath, str(e)))
