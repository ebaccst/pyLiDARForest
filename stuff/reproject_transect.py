import os
import time
import logging
from shutil import rmtree
from transect import Transect
from osgeo import ogr, gdal


def has_extension(file, extension):
    return file.endswith(extension, -1 * len(extension))


def get_files(path, _sof_):
    files = []
    for mfile in os.listdir(path):
        if os.path.isfile(os.path.join(path, mfile)) and _sof_(mfile):
            files.append(mfile)
    return files


def is_a_transect(file):
    return has_extension(file, ".asc")


def is_polygon_dir(dir):
    return dir.startswith("POLIGONO")


def get_transect_bouding_box(transect):
    transect_dir_name = "T-" + transect.number
    original_transect_dir = os.path.join(TRANSECT, transect_dir_name)

    if os.path.isdir(original_transect_dir):
        bouding_box_file = "POLIGONO_T-" + transect.number + ".shp"

        for pol_dir in os.listdir(original_transect_dir):
            if is_polygon_dir(pol_dir):
                return os.path.join(original_transect_dir, pol_dir, bouding_box_file)
    else:
        raise RuntimeError("Directory '{}' not found".format(original_transect_dir))


def get_ogr_dataset(data):
    drive_name = "ESRI Shapefile"
    driver = ogr.GetDriverByName(drive_name)
    return driver.Open(data)


def get_spatial_reference(dataset):
    layer = dataset.GetLayer()
    return layer.GetSpatialRef()


def get_gdal_dataset(data):
    return gdal.Open(data)


def reproject(transect):
    # Open the bounding box dataset
    bouding_box_file = get_transect_bouding_box(transect)
    bounding_box_dataset = get_ogr_dataset(bouding_box_file)

    # Define target SRS
    output_srs = get_spatial_reference(bounding_box_dataset)
    output_srs.MorphToESRI()
    output_wkt = output_srs.ExportToWkt()

    # Open the source dataset
    input_transect = get_gdal_dataset(transect.path)

    error_threshold = 0.125  # error threshold --> use same value as in gdalwarp
    resampling = gdal.GRA_Bilinear


    # Call AutoCreateWarpedVRT() to fetch default values for target raster dimensions and geotransform
    temp_dataset = gdal.AutoCreateWarpedVRT(input_transect,
                                            None,  # src_wkt : left to default value --> will use the one from source
                                            output_wkt,
                                            resampling,
                                            error_threshold)

    output_geotransform = temp_dataset.GetGeoTransform()

    # Create the target dataset
    output_file = os.path.join(OUTPUT_DIR, transect.file)
    logging.info("Copying '{}'".format(output_file))

    asc_driver_name = "AAIGrid"
    asc_driver = gdal.GetDriverByName(asc_driver_name)
    output_transect = asc_driver.CreateCopy(output_file, temp_dataset)
    del temp_dataset

    # Setting projection
    logging.info("Setting projection '{}'".format(transect.file))
    output_transect.SetProjection(output_wkt)
    output_transect.SetGeoTransform(output_geotransform)


if __name__ == "__main__":
    # Server
    #logging.basicConfig(filename="reproject.log", level=logging.INFO)

    # Test
    logging.basicConfig(level=logging.INFO)

    # Path
    TRANSECT = r"G:\TRANSECTS"
    METRICS = r"E:\heitor.guerra\CHM_avg50_para fazer_AGB"

    # Measure process time
    t0 = time.clock()

    OUTPUT_DIR = METRICS + "_reprojected"
    if os.path.isdir(OUTPUT_DIR):
        logging.info("Removing directory '{}'".format(OUTPUT_DIR))
        rmtree(OUTPUT_DIR)

    os.mkdir(OUTPUT_DIR)

    errors = {}
    transects = get_files(METRICS, is_a_transect)
    for file in transects:
        transect = Transect(METRICS, file)

        try:
            reproject(transect)
        except Exception as e:
            logging.error("Error to process '{}': {}".format(transect.path, e))
            errors[transect] = e

    if len(errors) > 0:
        logging.warning("Transects with problems: ")
        for transect, error in errors.iteritems():
            logging.warning("T-{} with {}".format(transect.number, error))

    logging.info("The transects were reprojected in {} seconds.".format(time.clock() - t0))
