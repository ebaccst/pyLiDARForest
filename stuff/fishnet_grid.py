import os
import argparse
import logging
import ogr, osr, gdal
from osgeo.gdalconst import *
from math import ceil


def extent(raster):
    src_ds = gdal.Open(raster, GA_ReadOnly)
    geoTransform = src_ds.GetGeoTransform()

    width = geoTransform[1]
    height = geoTransform[5]
    xmin = geoTransform[0]
    ymax = geoTransform[3]
    xmax = xmin + width * src_ds.RasterXSize
    ymin = ymax + height * src_ds.RasterYSize

    return {
        'xmin': xmin,
        'xmax': xmax,
        'ymin': ymin,
        'ymax': ymax,
        'width': width,
        'height': -height
    }


def grid(outputGridfn, xmin, xmax, ymin, ymax, gridHeight, gridWidth, layer=None):
    # convert sys.argv to float
    xmin = float(xmin)
    xmax = float(xmax)
    ymin = float(ymin)
    ymax = float(ymax)
    gridWidth = float(gridWidth)
    gridHeight = float(gridHeight)

    # get rows
    rows = ceil((ymax - ymin) / gridHeight)
    # get columns
    cols = ceil((xmax - xmin) / gridWidth)

    # start grid cell envelope
    ringXleftOrigin = xmin
    ringXrightOrigin = xmin + gridWidth
    ringYtopOrigin = ymax
    ringYbottomOrigin = ymax - gridHeight

    if not layer:
        outDriver = ogr.GetDriverByName('ESRI Shapefile')
        if os.path.exists(outputGridfn):
            os.remove(outputGridfn)
        outDataSource = outDriver.CreateDataSource(outputGridfn)
        outLayer = outDataSource.CreateLayer(outputGridfn, geom_type=ogr.wkbPolygon)
    else:
        outLayer = layer

    # LayerDefn
    featureDefn = outLayer.GetLayerDefn()

    # create grid cells
    countcols = 0
    while countcols < cols:
        countcols += 1

        # reset envelope for rows
        ringYtop = ringYtopOrigin
        ringYbottom = ringYbottomOrigin
        countrows = 0

        while countrows < rows:
            countrows += 1
            ring = ogr.Geometry(ogr.wkbLinearRing)
            ring.AddPoint(ringXleftOrigin, ringYtop)
            ring.AddPoint(ringXrightOrigin, ringYtop)
            ring.AddPoint(ringXrightOrigin, ringYbottom)
            ring.AddPoint(ringXleftOrigin, ringYbottom)
            ring.AddPoint(ringXleftOrigin, ringYtop)
            poly = ogr.Geometry(ogr.wkbPolygon)
            poly.AddGeometry(ring)

            # add new geom to layer
            outFeature = ogr.Feature(featureDefn)
            outFeature.SetGeometry(poly)
            outLayer.CreateFeature(outFeature)
            outFeature = None

            # new envelope for next poly
            ringYtop = ringYtop - gridHeight
            ringYbottom = ringYbottom - gridHeight

        # new envelope for next poly
        ringXleftOrigin = ringXleftOrigin + gridWidth
        ringXrightOrigin = ringXrightOrigin + gridWidth

    # Save and close DataSources
    if not layer:
        outDataSource = None


def pg_layer(table, raster, srs, geom_type=ogr.wkbPolygon, server="localhost", dbname="eba", user="eba",
             password="ebaeba18"):
    conn_str = "PG: host=%s dbname=%s user=%s password=%s" % (server, dbname, user, password)
    conn = ogr.Open(conn_str)
    layer = conn.CreateLayer(table, srs, geom_type, ['OVERWRITE=YES'])

    ext = extent(raster)
    grid(table, ext["xmin"], ext["xmax"], ext["ymin"], ext["ymax"], ext["height"], ext["width"], layer)
    del conn


if __name__ == "__main__":
    #
    # example run : $ python grid.py <full-path><output-shapefile-name>.shp xmin xmax ymin ymax gridHeight gridWidth
    # python grid.py grid.shp 992325.66 1484723.41 494849.32 781786.14 10000 10000
    #
    parser = argparse.ArgumentParser(description="OGR Grid")
    parser.add_argument("-s", "--server", type=str, default="localhost")
    parser.add_argument("-d", "--dbname", type=str, default="eba")
    parser.add_argument("-u", "--user", type=str, default="eba")
    parser.add_argument("-p", "--password", type=str, default="ebaeba18")
    parser.add_argument("-e", "--epsg", type=int, default=5880)
    parser.add_argument("-l", "--log", type=str, default=None, help="Logs to a file. Default 'console'.")
    parser.add_argument("-t", "--table", type=str, required=True)
    parser.add_argument("-r", "--rasterpath", type=str, required=True, help="Raster file.")
    args = parser.parse_args()

    if args.log:
        logging.basicConfig(filename=args.log, level=logging.INFO)
        logging.getLogger().addHandler(logging.StreamHandler())
    else:
        logging.basicConfig(level=logging.INFO)

    try:
        logging.info("Running 'Grid' to path '{}'...".format(args.table))
        srs = osr.SpatialReference()
        srs.ImportFromEPSG(args.epsg)

        pg_layer(args.table, args.rasterpath, srs, server=args.server, dbname=args.dbname, user=args.user, password=args.password)
    except Exception as e:
        logging.error("Error to 'Grid' file: {}".format(str(e)))
