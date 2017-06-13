import os
import time
import logging
from shutil import rmtree
from transect import Transect
from osgeo import ogr, osr, gdal


class Reproject(object):

    def __init__(self, transectsPath, metricsPath, outputPath):
        self._transectsPath = transectsPath
        self._metricsPath = metricsPath
        self._outputPath = outputPath

    def getFiles(self, _sof_):
        files = []
        for filename in os.listdir(self._metricsPath):
            if os.path.isfile(os.path.join(self._metricsPath, filename)) and _sof_(filename):
                files.append(Transect(self._metricsPath, filename))
        return files

    def isTransect(self, filename):
        return self.__hasExtension(filename, ".asc")

    def asc(self, transect):
        ASC_DRIVER_NAME = "AAIGrid"
        self.__reprojectGdal(transect, ASC_DRIVER_NAME)

    def isShapefile(self, filename):
        return self.__hasExtension(filename, ".shp")

    def shp(self, transect):
        SHP_DRIVER_NAME = "ESRI Shapefile"
        self.__reprojectOgr(transect, SHP_DRIVER_NAME)

    def __hasExtension(self, filename, extension):
        return filename.endswith(extension, -1 * len(extension))

    def __isPolygonDir(self, dirname):
        return dirname.startswith("POLIGONO")

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

    def __getOgrDataset(self, data):
        OGR_DRIVER_NAME = "ESRI Shapefile"
        ogrDriver = ogr.GetDriverByName(OGR_DRIVER_NAME)
        return ogrDriver.Open(data)

    def __getSpatialReference(self, dataset):
        ogrLayer = dataset.GetLayer()
        return ogrLayer.GetSpatialRef()

    def __getGdalDataset(self, data):
        return gdal.Open(data)

    def __reprojectGdal(self, transect, gdalDriverName):
        # Open the bounding box dataset
        boudingBoxFile = self.__getTransectBoudingBox(transect)
        boundingBoxDataset = self.__getOgrDataset(boudingBoxFile)

        # Define target SRS
        outputSrs = self.__getSpatialReference(boundingBoxDataset)
        outputSrs.MorphToESRI()
        outputWkt = outputSrs.ExportToWkt()

        # Open the source dataset
        inputTransect = self.__getGdalDataset(transect.path)

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

        gdalDriver = gdal.GetDriverByName(gdalDriverName)
        outputTransect = gdalDriver.CreateCopy(outputFile, tempDataset)
        del tempDataset

        # Setting projection
        logging.info("Setting projection '{}'".format(transect.file))
        outputTransect.SetProjection(outputWkt)
        outputTransect.SetGeoTransform(outputGeotransform)

    def __reprojectOgr(self, transect, ogr_driver_name):
        # OGR driver
        ogrDriver = ogr.GetDriverByName(ogr_driver_name)

        # Open the bounding box dataset
        boundingBoxDataset = ogrDriver.Open(self.__getTransectBoudingBox(transect))
        boundingBoxLayer = boundingBoxDataset.GetLayer()

        # Open the source layer
        inputTransectDataset = ogrDriver.Open(transect.path)
        inputTransectLayer = inputTransectDataset.GetLayer()
        inputTransectDefn = inputTransectLayer.GetLayerDefn()
        inputTransectFeatures = inputTransectLayer.GetNextFeature()

        # Create the CoordinateTransformation
        outputSpatialReference = boundingBoxLayer.GetSpatialRef()
        outputCoordtransformation = osr.CoordinateTransformation(inputTransectLayer.GetSpatialRef(), outputSpatialReference)

        # Create the output layer
        outputFilepath = os.path.join(self._outputPath, transect.file)
        outputLayerName = os.path.splitext(transect.file)[0]
        logging.info("Copying '{}'".format(outputFilepath))

        if os.path.exists(outputFilepath):
            ogrDriver.DeleteDataSource(outputFilepath)
        outputTransectDataset = ogrDriver.CreateDataSource(outputFilepath)
        outputTransectLayer = outputTransectDataset.CreateLayer(outputLayerName,
                                                                outputSpatialReference,
                                                                inputTransectDefn.GetGeomType(),
                                                                ['OVERWRITE=YES', 'GEOMETRY_NAME=geom', 'DIM=2','FID=id'])

        # Add fields
        for i in range(0, inputTransectDefn.GetFieldCount()):
            field_defn = inputTransectDefn.GetFieldDefn(i)
            outputTransectLayer.CreateField(field_defn)

        # get the output layer's feature definition
        outputTransectDefn = outputTransectLayer.GetLayerDefn()

        # loop through the input features
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
            # add the feature to the shapefile
            outputTransectLayer.CreateFeature(outputFeature)
            # dereference the features and get the next input feature
            outputFeature = None
            inputTransectFeatures = inputTransectLayer.GetNextFeature()

        # Save and close the shapefiles
        boundingBoxDataset.Destroy()
        inputTransectDataset.Destroy()
        outputTransectDataset.Destroy()


if __name__ == "__main__":
    # Server
    #logging.basicConfig(filename="reproject.log", level=logging.INFO)

    # Test
    logging.basicConfig(level=logging.INFO)

    # Path
    TRANSECT = r"G:\TRANSECTS"
    METRICS = r"E:\heitor.guerra\SHAPES_transectos\teste"

    # Create output directory
    OUTPUT_DIR = METRICS + "_reprojected_TESTE"
    if os.path.isdir(OUTPUT_DIR):
        logging.info("Removing directory '{}'".format(OUTPUT_DIR))
        rmtree(OUTPUT_DIR)
    os.mkdir(OUTPUT_DIR)

    # Measure process time
    t0 = time.clock()

    # Reproject
    errors = {}
    reproject = Reproject(TRANSECT, METRICS, OUTPUT_DIR)
    transects = reproject.getFiles(reproject.isShapefile)
    for transect in transects:
        try:
            #reproject.asc(transect)
            reproject.shp(transect)
        except Exception as e:
            logging.error("Error to process '{}': {}".format(transect.path, e))
            errors[transect] = e

    if len(errors) > 0:
        logging.warning("Transects with problems: ")
        for transect, error in errors.iteritems():
            logging.warning("T-{} with {}".format(transect.number, error))

    logging.info("The transects were reprojected in {} seconds.".format(time.clock() - t0))
