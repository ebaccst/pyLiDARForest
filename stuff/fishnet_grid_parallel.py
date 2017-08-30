import argparse
import logging
from math import ceil
from time import time

import gdal
import ogr
import osr
from osgeo.gdalconst import *


class CellularSpace(object):
    def __init__(self, raster, table, epsg=5880, geom_type=ogr.wkbPolygon, server="localhost", dbname="eba", user="eba",
                 password="ebaeba18"):
        self._xmin, self._xmax, self._ymin, self._ymax, self._width, self._height = CellularSpace.extent(raster)

        conn_str = "PG: host=%s dbname=%s user=%s password=%s" % (server, dbname, user, password)

        logging.info("Trying to connect PostgresSQL database: {}".format(conn_str))
        conn = ogr.Open(conn_str)
        assert conn

        gdal_options = ['OVERWRITE=YES']
        srs = osr.SpatialReference()
        srs.ImportFromEPSG(epsg)

        logging.info("Trying to create table: {}, {}, {}".format(table, str(geom_type), str(gdal_options)))
        logging.info("With projection: {}".format(str(srs)))
        self._table = table
        self._conn = conn
        self._layer = self._conn.CreateLayer(table, srs, geom_type, gdal_options)

    def create(self):
        logging.info("Creating a boundig box with extent: {}".format(
            (self._xmin, self._xmax, self._ymin, self._ymax, self._width, self._height)))

        rows = ceil((self._ymax - self._ymin) / self._height)
        cols = ceil((self._xmax - self._xmin) / self._width)
        logging.info("Creating a grid with {} rows and {} cols ({} cells)".format(rows, cols, rows * cols))

        ring_xleft_origin = self._xmin
        ring_xright_origin = self._xmin + self._width
        ring_ytop_origin = self._ymax
        ring_ybottom_origin = self._ymax - self._height

        progress_cont = 0.0
        progress_total = cols
        progress_previous = CellularSpace.progress_bar(progress_cont, progress_total)

        transaction_count = 0
        countcols = 0
        featureDefn = self._layer.GetLayerDefn()

        logging.info("Starting grid envelope...")
        while countcols < cols:
            countcols += 1

            ring_ytop = ring_ytop_origin
            ring_ybottom = ring_ybottom_origin
            countrows = 0

            while countrows < rows:
                countrows += 1
                ring = ogr.Geometry(ogr.wkbLinearRing)
                ring.AddPoint(ring_xleft_origin, ring_ytop)
                ring.AddPoint(ring_xright_origin, ring_ytop)
                ring.AddPoint(ring_xright_origin, ring_ybottom)
                ring.AddPoint(ring_xleft_origin, ring_ybottom)
                ring.AddPoint(ring_xleft_origin, ring_ytop)
                poly = ogr.Geometry(ogr.wkbPolygon)
                poly.AddGeometry(ring)

                if transaction_count == 0:
                    self._layer.StartTransaction()

                out_feature = ogr.Feature(featureDefn)
                out_feature.SetGeometry(poly)
                self._layer.CreateFeature(out_feature)
                transaction_count += 1
                del out_feature

                if transaction_count == 1000:
                    self._layer.CommitTransaction()
                    transaction_count = 0

                ring_ytop = ring_ytop - self._height
                ring_ybottom = ring_ybottom - self._height
            ring_xleft_origin = ring_xleft_origin + self._width
            ring_xright_origin = ring_xright_origin + self._width

            progress_cont += 1
            progress_previous = CellularSpace.progress_bar(progress_cont, progress_total, progress_previous)

        if transaction_count > 0:
            logging.info("Closing transaction with {} records".format(transaction_count))
            self._layer.CommitTransaction()
        del transaction_count
        del progress_cont

    def close(self):
        del self._layer
        del self._conn

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

    @staticmethod
    def extent(raster):
        raster_ds = gdal.Open(raster, GA_ReadOnly)
        assert raster_ds

        geoTransform = raster_ds.GetGeoTransform()
        width = geoTransform[1]
        height = geoTransform[5]
        xmin = geoTransform[0]
        ymax = geoTransform[3]
        xmax = xmin + width * raster_ds.RasterXSize
        ymin = ymax + height * raster_ds.RasterYSize

        del raster_ds
        return xmin, xmax, ymin, ymax, width, -height


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="FishNetGrid")
    parser.add_argument("-s", "--server", type=str, default="localhost")
    parser.add_argument("-d", "--dbname", type=str, default="eba")
    parser.add_argument("-u", "--user", type=str, default="eba")
    parser.add_argument("-p", "--password", type=str, default="ebaeba18")
    parser.add_argument("-e", "--epsg", type=int, default=5880)
    parser.add_argument("-l", "--log", type=str, default=None, help="Logs to a file. Default 'console'.")
    parser.add_argument("-r", "--raster", type=str, required=True, help="Raster file.")
    parser.add_argument("-t", "--table", type=str, required=True)
    args = parser.parse_args()

    if args.log:
        logging.basicConfig(filename=args.log, level=logging.INFO)
        logging.getLogger().addHandler(logging.StreamHandler())
    else:
        logging.basicConfig(level=logging.INFO)

    try:
        cs = CellularSpace(args.raster, args.table, epsg=args.epsg, server=args.server, dbname=args.dbname,
                           user=args.user, password=args.password)
        t0 = time()
        cs.create()
        cs.close()

        logging.info("Table created with success in {0:.2f} seconds!".format(time() - t0))
    except Exception as e:
        logging.error("Error to 'FishNetGrid' file: {}".format(str(e)))
