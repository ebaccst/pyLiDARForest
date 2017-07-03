import os
import time
import logging
import argparse
from shutil import rmtree
from transect import Transect
from osgeo import ogr, osr, gdal


class Reproject(object):
    @staticmethod
    def processCmdLine():
        parser = argparse.ArgumentParser(description="Reproject a Transect using the bounding box coordinates.")
        parser.add_argument("-t", "--transects", type=str, help="Path of the Transects.")
        parser.add_argument("-e", "--epsg", type=int, help="EPSG code.")
        parser.add_argument("-p", "--path", type=str, help="Path of the files to process.")
        parser.add_argument("-o", "--output", type=str,help="Destination path of output files. Default 'path + _reprojected'.")
        parser.add_argument("-d", "--driver", type=str, default="ogr", help="GDAL drivers. Default 'ogr'.")
        parser.add_argument("-i", "--insertnumber", type=bool, default=False, help="Insert transect number. Default 'False'.")
        parser.add_argument("-l", "--log", type=str, help="Logs to a file. Default 'console'.")

        args = parser.parse_args()
        if not (args.transects or args.epsg) or (args.transects and args.epsg):
            raise RuntimeError("Argument 'transects' or 'epsg' is mandatory.")

        if args.transects and not os.path.isdir(args.transects):
            raise RuntimeError("Directory '{}' not found".format(args.transects))

        if not os.path.isdir(args.path):
            raise RuntimeError("Directory '{}' not found".format(args.path))
        return args

    def __init__(self, transectsPath, metricsPath, outputPath, epsg, insertNumber):
        self._transectsPath = transectsPath
        self._metricsPath = metricsPath
        self._outputPath = outputPath
        self._epsg = epsg
        self._insertNumber = insertNumber

    def run(self, log=None, driver="ogr"):
        if log:
            logging.basicConfig(filename=log, level=logging.INFO)
        else:
            logging.basicConfig(level=logging.INFO)

        if os.path.isdir(self._outputPath):
            logging.info("Removing directory '{}'".format(self._outputPath))
            rmtree(self._outputPath)
        os.mkdir(self._outputPath)

        if driver == "ogr":
            transects = self.__getFiles(self.__isShapefile)
            reprojectFunction = self.__ogr
        elif driver == "gdal":
            transects = self.__getFiles(self.__isGdal)
            reprojectFunction = self.__gdal
        else:
            raise RuntimeError("Driver '{}' not supported".format(driver))

        errors = {}
        t0 = time.clock()
        for transect in transects:
            try:
                if self._epsg:
                    self.__reprojectUsingSpatialRef(transect, reprojectFunction)
                else:
                    self.__reprojectUsingBoundingBox(transect, reprojectFunction)
            except Exception as e:
                logging.error("Error to process '{}': {}".format(transect.path, e))
                errors[transect] = e

        if len(errors) > 0:
            logging.warning("Transects with problems: ")
            for transect, error in errors.iteritems():
                logging.warning("T-{} with {}".format(transect.number, error))

        logging.info("The transects were reprojected in {} seconds.".format(time.clock() - t0))

    def __gdal(self, transect, outputSrs):
        # Define target SRS
        outputSrs.MorphToESRI()
        outputWkt = outputSrs.ExportToWkt()

        # Open the source dataset
        inputTransect = gdal.Open(transect.path)
        gdalDriver = inputTransect.GetDriver()

        errorThreshold = 0.125  # error threshold --> use same value as in gdalwarp
        resampling = gdal.GRA_Bilinear

        # Call AutoCreateWarpedVRT() to fetch default values for target raster dimensions and geotransform
        tempDataset = gdal.AutoCreateWarpedVRT(inputTransect,
                                               None,  # src_wkt : left to default value --> will use the one from source
                                               outputWkt,
                                               resampling,
                                               errorThreshold)

        outputGeotransform = tempDataset.GetGeoTransform()

        # Create the target dataset
        outputFile = os.path.join(self._outputPath, transect.file)
        logging.info("Copying '{}'".format(outputFile))

        outputTransect = gdalDriver.CreateCopy(outputFile, tempDataset)
        del tempDataset

        # Setting projection
        logging.info("Setting projection '{}'".format(outputWkt))
        outputTransect.SetProjection(outputWkt)
        outputTransect.SetGeoTransform(outputGeotransform)

    def __getFiles(self, _sof_):
        files = []
        for filename in os.listdir(self._metricsPath):
            if os.path.isfile(os.path.join(self._metricsPath, filename)) and _sof_(filename):
                files.append(Transect(self._metricsPath, filename))
        return files

    def __getTransectBoudingBox(self, transect):
        BASE_NAME_DIR = "T-"
        BASE_NAME_TRANSECT = "POLIGONO_T-"
        BASE_EXTENSION = ".shp"

        transectDirName = BASE_NAME_DIR + transect.number
        originalTransectDir = os.path.join(self._transectsPath, transectDirName)
        if os.path.isdir(originalTransectDir):
            boudingBoxFile = BASE_NAME_TRANSECT + transect.number + BASE_EXTENSION
            for pol_dir in os.listdir(originalTransectDir):
                if self.__isPolygonDir(pol_dir):
                    return os.path.join(originalTransectDir, pol_dir, boudingBoxFile)
        else:
            raise RuntimeError("Directory '{}' not found".format(originalTransectDir))

    def __hasExtension(self, filename, extension):
        return filename.lower().endswith(extension.lower(), -1 * len(extension))

    def __isGdal(self, filename):
        return self.__hasExtension(filename, ".asc") or self.__hasExtension(filename, ".tif")

    def __isShapefile(self, filename):
        return self.__hasExtension(filename, ".shp")

    def __isPolygonDir(self, dirname):
        return dirname.startswith("POLIGONO")

    def __ogr(self, transect, outputSpatialReference):
        numberNameRef = "TRANSECT"
        numberFieldValue = "T-{}".format(transect.number)

        # Open the source layer
        inputTransectDataset = ogr.Open(transect.path)
        ogrDriver = inputTransectDataset.GetDriver()
        inputTransectLayer = inputTransectDataset.GetLayer()
        inputTransectDefn = inputTransectLayer.GetLayerDefn()
        inputTransectFeatures = inputTransectLayer.GetNextFeature()
        inputSpatialReference = outputSpatialReference
        if self._epsg:
            inputSpatialReference = inputTransectLayer.GetSpatialRef()

        # Create the CoordinateTransformation
        logging.info("Coordinate Transformation '{}'".format(outputSpatialReference.ExportToWkt()))
        outputCoordtransformation = osr.CoordinateTransformation(inputSpatialReference, outputSpatialReference)

        # Create the output layer
        outputFilepath = os.path.join(self._outputPath, transect.file)
        logging.info("Copying '{}'".format(outputFilepath))

        if os.path.exists(outputFilepath):
            ogrDriver.DeleteDataSource(outputFilepath)
        outputTransectDataset = ogrDriver.CreateDataSource(outputFilepath)
        outputTransectLayer = outputTransectDataset.CreateLayer(numberFieldValue,
                                                                outputSpatialReference,
                                                                inputTransectDefn.GetGeomType())
        # Add fields
        for i in range(0, inputTransectDefn.GetFieldCount()):
            field_defn = inputTransectDefn.GetFieldDefn(i)
            outputTransectLayer.CreateField(field_defn)

        if self._insertNumber:
            field = ogr.FieldDefn(numberNameRef, ogr.OFTString)
            outputTransectLayer.CreateField(field)

        # Get the output layer's feature definition
        outputTransectDefn = outputTransectLayer.GetLayerDefn()

        # Loop through the input features
        while inputTransectFeatures:
            # get the input geometry
            geom = inputTransectFeatures.GetGeometryRef()
            # reproject the geometry
            geom.Transform(outputCoordtransformation)
            # create a new feature
            outputFeature = ogr.Feature(outputTransectDefn)
            # set the geometry and attribute
            outputFeature.SetGeometry(geom)
            for i in range(0, outputTransectDefn.GetFieldCount()):
                outputFeature.SetField(outputTransectDefn.GetFieldDefn(i).GetNameRef(), inputTransectFeatures.GetField(i))
            if self._insertNumber:
                outputFeature.SetField(numberNameRef, numberFieldValue)
            # add the feature to the data
            outputTransectLayer.CreateFeature(outputFeature)
            # dereference the features and get the next input feature
            del outputFeature
            inputTransectFeatures = inputTransectLayer.GetNextFeature()

        # Save and close the data
        inputTransectDataset.Destroy()
        outputTransectDataset.Destroy()

    def __reprojectUsingBoundingBox(self, transect, __sof__):
        # OGR driver
        ogrDriver = ogr.GetDriverByName("ESRI Shapefile")
        # Open the bounding box dataset
        boundingBoxDataset = ogrDriver.Open(self.__getTransectBoudingBox(transect))
        boundingBoxLayer = boundingBoxDataset.GetLayer()
        outputSpatialReference = boundingBoxLayer.GetSpatialRef()
        # Run reproject
        __sof__(transect, outputSpatialReference)
        # Destroy dataset
        boundingBoxDataset.Destroy()

    def __reprojectUsingSpatialRef(self, transect, __sof__):
        outSpatialRef = osr.SpatialReference()
        outSpatialRef.ImportFromEPSG(self._epsg)
        __sof__(transect, outSpatialRef)

if __name__ == "__main__":
    # C:\Anaconda\envs\geo\python.exe "E:\heitor.guerra\PycharmProjects\pyLiDARForest\stuff\reproject_transect.py" -t "G:\TRANSECTS" -p "E:\heitor.guerra\TESTE_GDAL" -d "gdal"
    try:
        args = Reproject.processCmdLine()
        reproject = Reproject(transectsPath=args.transects, epsg=args.epsg, metricsPath=args.path, outputPath=args.output or args.path + "_reprojected", insertNumber=args.insertnumber)
        reproject.run(log=args.log, driver=args.driver)
    except Exception as e:
        raise RuntimeError("Unexpected error: {}".format(e))
