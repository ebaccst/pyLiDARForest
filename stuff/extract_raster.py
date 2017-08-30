import argparse
import logging
import os
from time import time

from osgeo import gdal, ogr


class Extractor(object):
    def __init__(self, statement, raster, output, format='GTiff', nodata=None, datatype=gdal.GDT_Float32,
                 bands=1, server="localhost", dbname="eba", user="eba", password="ebaeba18"):
        assert statement
        assert raster
        assert output
        assert os.path.isfile(raster)
        assert os.path.isdir(output)

        conn_str = "PG: host=%s dbname=%s user=%s password=%s" % (server, dbname, user, password)

        logging.info("Trying to connect PostgresSQL database: {}".format(conn_str))
        conn = ogr.Open(conn_str)
        assert conn

        logging.info("Loading the reference raster: {}".format(raster))
        ds = gdal.Open(raster, gdal.gdalconst.GA_ReadOnly)
        assert ds

        logging.info("Querying data source and read in the extent ({})".format(statement))
        layer = conn.ExecuteSQL(statement)
        assert layer

        ds_bands = ds.RasterCount
        if bands > ds_bands:
            raise RuntimeError("Number of bands is greater than raster count.")

        self._connection = conn
        self._base_raster = ds
        self._output = output
        self._format = format
        self._nodata = nodata
        self._datatype = datatype
        self._bands = bands
        self._layer = layer

    def rasterize(self, attributes):
        assert attributes

        for attr in attributes:
            logging.info("Rasterizing {}...".format(attr))
            output = os.path.join(self._output, attr + ".tif")
            raster = self.new_raster_from_base(output)
            gdal.RasterizeLayer(raster, [self._bands], self._layer, options=["ATTRIBUTE={}".format(attr)])
            del raster

        logging.info("Closing connection...")
        del self._connection

        logging.info("Done.")

    def new_raster_from_base(self, output):
        cols = self._base_raster.RasterXSize
        rows = self._base_raster.RasterYSize
        logging.info("Creating new raster with ({}) rows and ({}) columns".format(rows, cols))

        projection = self._base_raster.GetProjection()
        geotransform = self._base_raster.GetGeoTransform()

        driver = gdal.GetDriverByName(self._format)

        new_raster = driver.Create(output, cols, rows, self._bands, self._datatype)
        new_raster.SetProjection(projection)
        new_raster.SetGeoTransform(geotransform)

        for i in range(self._bands):
            n = i + 1
            band = new_raster.GetRasterBand(n)
            nodata_value = self._nodata or self._base_raster.GetRasterBand(n).GetNoDataValue()
            band.SetNoDataValue(nodata_value)
            band.Fill(nodata_value)
            band.FlushCache()
        return new_raster


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Extractor")
    parser.add_argument("-s", "--statement", type=str, required=True, help="SQL without ';'.")
    parser.add_argument("-a", "--attribute", type=str, required=True, nargs='+', help="Column name to be exported.")
    parser.add_argument("-r", "--raster", type=str, required=True, help="Raster file to extract extent.")
    parser.add_argument("-o", "--outputdir", type=str, required=True, help="Path of the new raster.")
    parser.add_argument("-f", "--format", type=str, default="GTiff", help="Format of raster.")
    parser.add_argument("-n", "--nodata", type=float, default=None, help="No data value. Default None.")
    parser.add_argument("-t", "--datatype", default=gdal.GDT_Float32, help="Data type. Default GDT_Byte")
    parser.add_argument("-l", "--log", type=str, default=None, help="Logs to a file. Default 'console'.")
    args = parser.parse_args()

    if args.log:
        logging.basicConfig(filename=args.log, level=logging.INFO)
        logging.getLogger().addHandler(logging.StreamHandler())
    else:
        logging.basicConfig(level=logging.INFO)

    try:
        logging.info("Running 'Extractor' with '{}' and '{}'...".format(args.statement, args.raster))
        ti = time()

        ex = Extractor(args.statement, args.raster, args.outputdir, args.format, args.nodata, args.datatype)
        ex.rasterize(args.attribute)

        tf_sec = int((time() - ti) % 60)
        tf_min = int((tf_sec / 60) % 60)
        tf_h = int((tf_min / 60) % 24)
        logging.info("Raster created with success in {} hours {} minutes {} seconds!".format(tf_h, tf_min, tf_sec))
    except Exception as e:
        logging.error("Error to process '{}' and '{}': {}".format(args.statement, args.raster, str(e)))
