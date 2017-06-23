"""
Zonal Statistics
Vector-Raster Analysis

Original version: Copyright 2013 Matthew Perry

Copyright 2017 Heitor G. Carneiro

Usage:
  zonal_stats.py VECTOR RASTER
  zonal_stats.py -h | --help
  zonal_stats.py --version

Options:
  -h --help     Show this screen.
  --version     Show version.
"""
from osgeo import gdal, ogr
from osgeo.gdalconst import *
import numpy as np
import sys
import os

gdal.PushErrorHandler('CPLQuietErrorHandler')


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


def zonal_stats(vector_path, raster_path, nodata_value=None, global_src_extent=False, export_result=False):
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
        out_path = os.path.join(out_path, "zona_stats_" + vector_filename)
        out_layer_name = os.path.splitext(vector_filename)[0]

        out_driver = vds.GetDriver()
        if os.path.exists(out_path):
            out_driver.DeleteDataSource(out_path)

        in_layer_defn = vlyr.GetLayerDefn()
        in_sref = vlyr.GetSpatialRef()

        out_dataset = out_driver.CreateDataSource(out_path)
        output_layer = out_dataset.CreateLayer(out_layer_name, in_sref, in_layer_defn.GetGeomType())

        fields = {
            'min': float,
            'mean': float,
            'max': float,
            'std': float,
            'sum': float,
            'count': int,
            'fid': int,
            'area': float,
            'filename': str
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
            'min': float(masked.min()),
            'mean': float(masked.mean()),
            'max': float(masked.max()),
            'std': float(masked.std()),
            'sum': float(masked.sum()),
            'count': int(masked.count()),
            'fid': int(feat.GetFID()),
            'area': float(geometry.Area())
        }

        stats.append(feature_stats)

        if export_result:
            feature_stats["filename"] = out_vector["out_layer_name"]
            out_layer = out_vector["output_layer"]
            out_layer_defn = out_layer.GetLayerDefn()
            geom = feat.GetGeometryRef()

            out_feature = ogr.Feature(out_layer_defn)
            out_feature.SetGeometry(geom)
            for i in range(0, out_layer_defn.GetFieldCount()):
                name_ref = out_layer_defn.GetFieldDefn(i).GetNameRef()
                field_value = None
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
    stats = zonal_stats(r"E:\heitor.guerra\ZonalStats\shp\QDR_A01aA06.shp",
                        r"E:\heitor.guerra\ZonalStats\asc_reprojected\NP_T-0400_dn_g_n_ch1_5CHM_1m.asc",
                        nodata_value=-9999.0, export_result=True)

    try:
        from pandas import DataFrame

        print DataFrame(stats)
    except ImportError:
        import json

        print json.dumps(stats, indent=2)
