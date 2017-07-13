from osgeo import gdal, ogr
from osgeo.gdalconst import *
from time import time
import numpy as np
import os
import logging

gdal.PushErrorHandler('CPLQuietErrorHandler')


class ZonalStats(object):
    @staticmethod
    def cmd_header():
        return "Zonal Statistics\n" \
               "Vector-Raster Analysis\n" \
               "Reference: Matthew Perry " \
               "(https://gist.githubusercontent.com/perrygeo/5667173/raw/763e1e50208e8c853f46e57cd07bb07b424fed10/zonal_stats.py)\n" \
               "Copyright 2017 Heitor G. Carneiro"

    def __init__(self, bouding_box, raster, server="localhost", dbname="eba", user="eba", password="ebaeba18"):
        conn_str = "PG: host=%s dbname=%s user=%s password=%s" % (server, dbname, user, password)
        conn = ogr.Open(conn_str)
        assert conn

        bb = conn.GetLayer(bouding_box)
        assert bb

        rds = gdal.Open(raster, GA_ReadOnly)
        assert rds

        self._conn = conn
        self._bb = bb
        self._raster_ds = rds
        self._bb_defn = self._bb.GetLayerDefn()
        self._raster_filename = os.path.splitext(os.path.basename(raster))[0].lower()
        self._fields = ('{}_min'.format(self._raster_filename), '{}_mean'.format(self._raster_filename),
                        '{}_max'.format(self._raster_filename), '{}_std'.format(self._raster_filename),
                        '{}_sum'.format(self._raster_filename), '{}_count'.format(self._raster_filename),
                        '{}_area'.format(self._raster_filename))

        newbb_name = "{}_{}".format(bouding_box, str(int(time())))
        srs = self._bb.GetSpatialRef()
        geom_type = self._bb_defn.GetGeomType()
        gdal_options = ['OVERWRITE=YES']
        self._newbb = self._conn.CreateLayer(newbb_name, srs, geom_type, gdal_options)

    def close(self):
        del self._bb
        del self._raster_ds
        del self._conn

    def extract(self, nodata_value=None):
        self.__create_fields_df()

        rb = self._raster_ds.GetRasterBand(1)
        rgt = self._raster_ds.GetGeoTransform()
        if nodata_value:
            nodata_value = float(nodata_value)
            rb.SetNoDataValue(nodata_value)
        else:
            nodata_value = rb.GetNoDataValue()

        mem_drv = ogr.GetDriverByName('Memory')
        ogr_driver = gdal.GetDriverByName('MEM')

        feat = self._bb.GetNextFeature()
        while feat:
            geometry = feat.geometry()

            src_offset = self.__bbox_to_pixel_offsets(rgt, geometry.GetEnvelope())
            src_array = rb.ReadAsArray(*src_offset)
            new_gt = (
                (rgt[0] + (src_offset[0] * rgt[1])),
                rgt[1],
                0.0,
                (rgt[3] + (src_offset[1] * rgt[5])),
                0.0,
                rgt[5]
            )

            mem_ds = mem_drv.CreateDataSource('out')
            mem_layer = mem_ds.CreateLayer('poly', None, ogr.wkbPolygon)
            mem_layer.CreateFeature(feat.Clone())

            rvds = ogr_driver.Create('', src_offset[2], src_offset[3], 1, gdal.GDT_Byte)
            rvds.SetGeoTransform(new_gt)
            gdal.RasterizeLayer(rvds, [1], mem_layer, burn_values=[1])
            rv_array = rvds.ReadAsArray()

            masked = np.ma.MaskedArray(
                src_array,
                mask=np.logical_or(
                    src_array == nodata_value,
                    np.logical_not(rv_array)
                )
            )

            feature_stats = {self._fields[6]: float(geometry.Area())}
            try:
                masked_stats = {
                    self._fields[0]: float(masked.min()),
                    self._fields[1]: float(masked.mean()),
                    self._fields[2]: float(masked.max()),
                    self._fields[3]: float(masked.std()),
                    self._fields[4]: float(masked.sum()),
                    self._fields[5]: int(masked.count()),
                }

                feature_stats.update(masked_stats)
            except Exception as masked_error:
                logging.error("Error to np.ma.MaskedArray: {}".format(str(masked_error)))

            newbb_defn = self._newbb.GetLayerDefn()
            new_feature = ogr.Feature(newbb_defn)
            new_feature.SetGeometry(geometry)

            field_count = newbb_defn.GetFieldCount()
            logging.info("Copying '{}' fields to '{}'".format(field_count, self._raster_filename))
            for i in range(0, field_count):
                name_ref = newbb_defn.GetFieldDefn(i).GetNameRef()
                if name_ref in feature_stats:
                    field_value = feature_stats[name_ref]
                else:
                    field_value = feat.GetField(i)
                new_feature.SetField(name_ref, field_value)

            self._newbb.StartTransaction()
            self._newbb.CreateFeature(new_feature)
            self._newbb.CommitTransaction()

            del new_feature
            del rvds
            del mem_ds
            feat = self._bb.GetNextFeature()

    def list_layers(self):
        layers = []
        for layer in self._conn:
            layer_name = layer.GetName()
            if layer_name not in layers:
                layers.append(layer_name)
        layers.sort()
        return layers

    def __create_fields_df(self):
        for i in range(0, self._bb_defn.GetFieldCount()):
            field_defn = self._bb_defn.GetFieldDefn(i)
            self._newbb.CreateField(field_defn)

        int_field = "count"
        for field_name in self._fields:
            field_type = ogr.OFTReal
            if int_field in field_name:
                field_type = ogr.OFTInteger
            field = ogr.FieldDefn(field_name, field_type)
            self._newbb.CreateField(field)

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


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    vectorpath = "vegtype"
    rasterpath = r"E:\heitor.guerra\EVI\soma_EVI_QUANTILE_bioma_5880.tif"

    zs = ZonalStats(vectorpath, rasterpath)
    zs.extract()
    zs.close()
