import os
import argparse
import logging
from osgeo import ogr
from osgeo.gdalconst import *


def list_files(file_startswith, file_endswith, directory):
    return [
        os.path.join(directory, file_name)
        for file_name in os.listdir(directory)
        if file_name.startswith(file_startswith) and file_name.endswith(file_endswith)
    ]


def merge(output_filename, file_startswith, file_endswith, directory):
    assert output_filename
    assert file_startswith
    assert file_endswith
    assert directory
    assert os.path.isdir(directory)
    logging.info("Merge OGR Layers within '{}'".format(directory))

    files = list_files(file_startswith, file_endswith, directory)
    iterator = iter(files)
    file_path = next(iterator)

    vector_ds = ogr.Open(file_path, GA_ReadOnly)
    vector_driver = vector_ds.GetDriver()
    vector_layer = vector_ds.GetLayer()
    vector_layer_defn = vector_layer.GetLayerDefn()
    geom_type = vector_layer_defn.GetGeomType()
    srs = vector_layer.GetSpatialRef()

    if os.path.exists(output_filename):
        vector_driver.DeleteDataSource(output_filename)
    out_ds = vector_driver.CreateDataSource(output_filename)
    out_layer = out_ds.CreateLayer(output_filename, srs, geom_type)

    for i in range(0, vector_layer_defn.GetFieldCount()):
        out_layer.CreateField(vector_layer_defn.GetFieldDefn(i))

    while file_path:
        for feat in vector_layer:
            out_feat = ogr.Feature(vector_layer_defn)
            out_feat.SetGeometry(feat.GetGeometryRef().Clone())

            for i in range(0, vector_layer_defn.GetFieldCount()):
                name_ref = vector_layer_defn.GetFieldDefn(i).GetNameRef()
                field_value = feat.GetField(i)
                out_feat.SetField(name_ref, field_value)
                logging.info("Copying field '{}' with value '{}'".format(name_ref, field_value))
            out_layer.CreateFeature(out_feat)
            del out_feat
            out_layer.SyncToDisk()

        file_path = next(iterator, None)
        if file_path:
            vector_ds = ogr.Open(file_path)
            vector_layer = vector_ds.GetLayer()
            vector_layer_defn = vector_layer.GetLayerDefn()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="OGR Merge")
    parser.add_argument("-v", "--vectorpath", type=str, required=True, help="Directory or Vector file.")
    parser.add_argument("-f", "--file", type=str, required=True, help="Name of the file exported.")
    parser.add_argument("-s", "--starts", type=str, default="NP_T-", help="Checks whether string starts with <str>. Default 'NP_T-'.")
    parser.add_argument("-e", "--ends", type=str, default=".shp", help="Checks whether string ends with <str>. Default 'NP_T-'.")
    parser.add_argument("-l", "--log", type=str, help="Logs to a file. Default 'console'.")
    args = parser.parse_args()

    if not os.path.isdir(args.vectorpath):
        raise RuntimeError("Vector path '{}' not found".format(args.vectorpath))

    if args.log:
        logging.basicConfig(filename=args.log, level=logging.INFO)
        logging.getLogger().addHandler(logging.StreamHandler())
    else:
        logging.basicConfig(level=logging.INFO)

    logging.info("Running 'merge' to path '{}'...".format(args.vectorpath))

    try:
        merge(args.file, args.starts, args.ends, args.vectorpath)
    except Exception as e:
        logging.error("Error to merge files: {}".format(str(e)))
