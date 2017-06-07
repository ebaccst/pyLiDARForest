# -*- coding: utf-8 -*-
import numpy as np
import sys
from shapely.geometry import Polygon, Point, MultiPolygon
import shapefile
#import dbutils
import os
import time
from fiona import collection
import cProfile

# https://www.e-education.psu.edu/geog486/node/1877

def Header():
    print('Interpolate grid biomass based on transects biomass v0.8')
    print('It uses centroids to do that')

def biomass1():
    Header()
#    transects = fiona.open(r'G:\biomasscalcdata\transects.shp')
#    grid1km = fiona.open(r'G:\biomasscalcdata\transects.shp')
    transectsfile = shapefile.Reader(r'G:\biomasscalcdata\transects.shp','r')
    grid1kmfile = shapefile.Reader(r'G:\biomasscalcdata\grid1km_clipped.shp','r')
#    transectscoll = collection(r'G:\biomasscalcdata\transects.shp','r')
#    grid1kmcoll = collection(r'G:\biomasscalcdata\grid1km_clipped.shp','r')
    print('Loading shapes...')
    start_time = time.time()
#    ts=transectsfile.shapes()
#    g1=grid1kmfile.shapes()
    elapsed = time.time()-start_time
    print('Ok in {0}s'.format(elapsed))
    samples=3
    sqlfname='biomasslongo.sql'
    sqlfile = open(sqlfname,mode='w')
    #grid1kmfile.fields
    c=0
    for shg1c in list(grid1kmfile.iterShapeRecords()):
        distances = []
        for shtrn in list(transectsfile.iterShapeRecords()):
           distances.append([shtrn.record[1],shtrn.record[2],Point(shg1c.shape.points[0][0],shg1c.shape.points[0][1]).distance(Point(shtrn.shape.points[0][0],shtrn.shape.points[0][1]))])
        num=0.0
        den=0.0
        distances.sort(key=lambda x:x[2])
        for i in range(samples):
            d2=distances[i][2]*distances[i][2]
            num+=distances[i][1]/d2
            den+=1/d2
        biomasslongo=num/den
        sql='UPDATE grid1km SET biomasslongo = {0} WHERE gid = {1};'.format(biomasslongo,shg1c.record[1])
        sqlfile.write(sql)
        c+=1
        if ((c % 100) == 0):
            print "\r",c,"processed.",
        if c > 100:
            return
    sqlfile.close()

if __name__ == '__main__':
    cProfile.run('biomass1()')
    print "The End."