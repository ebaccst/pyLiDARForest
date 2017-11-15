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
import traceback

import numpy as np
from osgeo import gdal, ogr
from osgeo.gdalconst import *
from pandas import DataFrame

gdal.PushErrorHandler('CPLQuietErrorHandler')


def cmd_header():
    return "Zonal Statistics\n" \
           "Vector-Raster Analysis\n" \
           "Reference: Matthew Perry " \
           "(https://gist.githubusercontent.com/perrygeo/5667173/raw/763e1e50208e8c853f46e57cd07bb07b424fed10/zonal_stats.py)\n" \
           "Copyright 2017 Heitor G. Carneiro"


def bbox_to_pixel_offsets(gt, bbox):
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


def zonal_stats(vector_path, raster_path, nodata_value=-9999.0, export_result=True, global_src_extent=False):
    rds = gdal.Open(raster_path, GA_ReadOnly)
    assert (rds)
    rb = rds.GetRasterBand(1)
    rgt = rds.GetGeoTransform()

    if nodata_value:
        nodata_value = float(nodata_value)
        rb.SetNoDataValue(nodata_value)

    vds = ogr.Open(vector_path, GA_ReadOnly)  # TODO maybe open update if we want to write stats
    assert (vds)
    vlyr = vds.GetLayer(0)

    # create an in-memory numpy array of the source raster data
    # covering the whole extent of the vector layer
    if global_src_extent:
        # use global source extent
        # useful only when disk IO or raster scanning inefficiencies are your limiting factor
        # advantage: reads raster data in one pass
        # disadvantage: large vector extents may have big memory requirements
        src_offset = bbox_to_pixel_offsets(rgt, vlyr.GetExtent())
        src_array = rb.ReadAsArray(*src_offset)

        # calculate new geotransform of the layer subset
        new_gt = (
            (rgt[0] + (src_offset[0] * rgt[1])),
            rgt[1],
            0.0,
            (rgt[3] + (src_offset[1] * rgt[5])),
            0.0,
            rgt[5]
        )

    mem_drv = ogr.GetDriverByName('Memory')
    ogr_driver = gdal.GetDriverByName('MEM')

    out_vector = {}
    if export_result:
        out_path, vector_filename = os.path.split(vector_path)
        raster_filename = os.path.splitext(os.path.basename(raster_path))[0]
        out_basename = raster_filename + "_" + vector_filename
        out_path = os.path.join(out_path, "zonal_stats_" + out_basename)
        out_layer_name = os.path.splitext(out_basename)[0]

        out_driver = vds.GetDriver()
        if os.path.exists(out_path):
            out_driver.DeleteDataSource(out_path)

        in_layer_defn = vlyr.GetLayerDefn()
        in_sref = vlyr.GetSpatialRef()

        out_dataset = out_driver.CreateDataSource(out_path)
        output_layer = out_dataset.CreateLayer(out_layer_name, in_sref, in_layer_defn.GetGeomType())

        fields = {
            'zs_min': float,
            'zs_mean': float,
            'zs_max': float,
            'zs_std': float,
            'zs_sum': float,
            'zs_count': int,
            'zs_fid': int,
            'zs_area': float,
            'zs_file': str,
            'zs_cv': float
        }

        for i in range(0, in_layer_defn.GetFieldCount()):
            field_defn = in_layer_defn.GetFieldDefn(i)
            output_layer.CreateField(field_defn)

        for attr, mtype in fields.iteritems():
            field_type = ogr.OFTReal
            if mtype is int:
                field_type = ogr.OFTInteger
            if mtype is str:
                field_type = ogr.OFTString
            field = ogr.FieldDefn(attr, field_type)
            output_layer.CreateField(field)

        out_vector["out_dataset"] = out_dataset
        out_vector["out_layer_name"] = out_layer_name
        out_vector["output_layer"] = output_layer

    # Loop through vectors
    stats = []
    feat = vlyr.GetNextFeature()
    while feat is not None:

        geometry = feat.geometry()
        if not global_src_extent:
            # use local source extent
            # fastest option when you have fast disks and well indexed raster (ie tiled Geotiff)
            # advantage: each feature uses the smallest raster chunk
            # disadvantage: lots of reads on the source raster
            src_offset = bbox_to_pixel_offsets(rgt, geometry.GetEnvelope())
            src_array = rb.ReadAsArray(*src_offset)

            # calculate new geotransform of the feature subset
            new_gt = (
                (rgt[0] + (src_offset[0] * rgt[1])),
                rgt[1],
                0.0,
                (rgt[3] + (src_offset[1] * rgt[5])),
                0.0,
                rgt[5]
            )

        # Create a temporary vector layer in memory
        mem_ds = mem_drv.CreateDataSource('out')
        mem_layer = mem_ds.CreateLayer('poly', None, ogr.wkbPolygon)
        mem_layer.CreateFeature(feat.Clone())

        # Rasterize it
        rvds = ogr_driver.Create('', src_offset[2], src_offset[3], 1, gdal.GDT_Byte)
        rvds.SetGeoTransform(new_gt)
        gdal.RasterizeLayer(rvds, [1], mem_layer, burn_values=[1])
        rv_array = rvds.ReadAsArray()

        # Mask the source data array with our current feature
        # we take the logical_not to flip 0<->1 to get the correct mask effect
        # we also mask out nodata values explictly
        masked = np.ma.MaskedArray(
            src_array,
            mask=np.logical_or(
                src_array == nodata_value,
                np.logical_not(rv_array)
            )
        )

        feature_stats = {
            'zs_fid': int(feat.GetFID()),
            'zs_area': float(geometry.Area())
        }

        try:
            zs_mean = float(masked.mean())
            zs_std = float(masked.std())
            masked_stats = {
                'zs_min': float(masked.min()),
                'zs_mean': zs_mean,
                'zs_max': float(masked.max()),
                'zs_std': zs_std,
                'zs_sum': float(masked.sum()),
                'zs_count': int(masked.count()),
            }

            if zs_mean > 0:
                zs_cv = (zs_std / zs_mean) * 100
                masked_stats['zs_cv'] = zs_cv
            feature_stats.update(masked_stats)
        except Exception as masked_error:
            logging.error("Error to np.ma.MaskedArray: {}".format(str(masked_error)))

        stats.append(feature_stats)

        if export_result:
            feature_stats["zs_file"] = out_vector["out_layer_name"]
            out_layer = out_vector["output_layer"]
            out_layer_defn = out_layer.GetLayerDefn()
            geom = feat.GetGeometryRef()

            out_feature = ogr.Feature(out_layer_defn)
            out_feature.SetGeometry(geom)
            for i in range(0, out_layer_defn.GetFieldCount()):
                name_ref = out_layer_defn.GetFieldDefn(i).GetNameRef()
                logging.info("Copying field '{}' to '{}'".format(name_ref, feature_stats["zs_file"]))
                if name_ref in feature_stats:
                    field_value = feature_stats[name_ref]
                else:
                    field_value = feat.GetField(i)

                out_feature.SetField(name_ref, field_value)
            out_layer.CreateFeature(out_feature)
            del out_feature

        del rvds
        del mem_ds
        del out_vector["out_dataset"]
        feat = vlyr.GetNextFeature()

    del vds
    del rds
    return stats


if __name__ == "__main__":
    # python zonal_stats.py QDR_A01aA06.shp NP_T-0400_dn_g_n_ch1_5CHM_1m.tif
    parser = argparse.ArgumentParser(description=cmd_header())
    parser.add_argument("-v", "--vectorpath", type=str, required=True, help="Vector file.")
    parser.add_argument("-r", "--rasterpath", type=str, required=True, help="Raster file.")
    parser.add_argument("-n", "--nodata", type=float, default=-9999.0, help="No data value. Default -9999.0.")
    parser.add_argument("-e", "--export", type=bool, default=True, help="Export result as a new file. Default True.")
    parser.add_argument("-g", "--globalextent", type=bool, default=False,
                        help="Create an in-memory numpy array of the source raster data. Default False.")
    parser.add_argument("-l", "--log", type=str, help="Logs to a file. Default 'console'.")
    args = parser.parse_args()

    if not os.path.isfile(args.vectorpath):
        raise RuntimeError("Vector '{}' not found".format(args.vectorpath))
    if not os.path.isfile(args.rasterpath):
        raise RuntimeError("Raster '{}' not found".format(args.rasterpath))

    if args.log:
        logging.basicConfig(filename=args.log, level=logging.INFO)
        logging.getLogger().addHandler(logging.StreamHandler())
    else:
        logging.basicConfig(level=logging.INFO)

    try:
        logging.info("Running 'zonal_stats' to '{}' and '{}'...".format(args.vectorpath, args.rasterpath))
        ti = time.clock()

        stats = zonal_stats(args.vectorpath, args.rasterpath, args.nodata, args.export, args.globalextent)
        logging.info(DataFrame(stats))

        tf_sec = int((time.clock() - ti) % 60)
        tf_min = int((tf_sec / 60) % 60)
        tf_h = int((tf_min / 60) % 24)
        logging.info("Stats extracted with success in {} hours {} minutes {} seconds!".format(tf_h, tf_min, tf_sec))
    except Exception as e:
        logging.error("Error to process '{}' and '{}': {}\n{}\n".format(args.vectorpath, args.rasterpath, str(e), traceback.format_exc()))
