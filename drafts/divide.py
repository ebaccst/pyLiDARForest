import os.path
import time
import argparse
from argparse import RawTextHelpFormatter
import numpy as np
import math
from laspy import file
import warnings
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import scipy.linalg

lasfilename=r"G:\T-356_CLIP.LAS"


def divideSquares(lasfilename): 
    inFile = file.File(lasfilename, mode = "r")
    
    #find x,y coordinates of corners of rectangular point cloud
    xmin = np.array([inFile.x[np.argmin(inFile.x)], inFile.y[np.argmin(inFile.x)], inFile.z[np.argmin(inFile.x)]])
    xmax = np.array([inFile.x[np.argmax(inFile.x)], inFile.y[np.argmax(inFile.x)], inFile.z[np.argmax(inFile.x)]])
    ymin = np.array([inFile.x[np.argmin(inFile.y)], inFile.y[np.argmin(inFile.y)], inFile.z[np.argmin(inFile.y)]])
    ymax = np.array([inFile.x[np.argmax(inFile.y)], inFile.y[np.argmax(inFile.y)], inFile.z[np.argmax(inFile.y)]])

    cloudall = np.column_stack((inFile.x, inFile.y, inFile.z))
    cloud = cloudall[0:1300000,:]
    #corners = np.vstack((xmin, xmax, ymin, ymax))

    if (ymin[0] - xmin[0])**2 + (xmin[1] - ymin[0])**2 < (xmax[0] - ymin[0])**2 + (xmax[1] - ymin[1])**2: #major axis leaning to the right
        trans = ymin #set new origin at this point
        theta1 = -np.arctan((xmax[1] - ymin[1]) / (xmax[0] - ymin[0]))
        theta2 = -np.arctan((ymax[1] - xmin[1]) / (ymax[0] - xmin[0]))
        theta = (theta1 + theta2) / 2
    else: #major axis leaning to left
        trans = xmin #set new origin at this point
        theta1 = np.arctan((xmin[1] - ymin[1]) / (ymin[0] - xmin[0]))
        theta2 = np.arctan((ymax[1] - xmax[1]) / (xmax[0] - ymax[0]))
        theta = (theta1 + theta2) / 2

    #tranformation to set new origin
    cloud[:,0] = cloud[:,0] - trans[0]
    cloud[:,1] = cloud[:,1] - trans[1]
    #corners[:,0] = corners[:,0] - trans[0]
    #corners[:,1] = corners[:,1] - trans[1]

    #matrix rotates theta radians anticlockwise about z axis
    rot = np.matrix([[np.cos(theta), -np.sin(theta), 0], [np.sin(theta), np.cos(theta), 0], [0, 0, 1]])    
    for i in range(len(cloud)):
        coords = np.array([cloud[i,0], cloud[i,1], cloud[i,2]])
        cloud[i,0] = np.dot(rot, coords)[0,0]
        cloud[i,1] = np.dot(rot, coords)[0,1]
    #for i in range(len(corners)):
    #    coords = np.array([corners[i,0], corners[i,1], corners[i,2]])
    #    corners[i,0] = np.dot(rot, coords)[0,0]
    #    corners[i,1] = np.dot(rot, coords)[0,1]
        
    #to make sure all coordinates are positive, another translation    
    cloud[:,0] = cloud[:,0] - cloud[:,0].min()
    cloud[:,1] = cloud[:,1] - cloud[:,1].min()
    #corners[:,0] = corners[:,0] - corners[:,0].min()
    #corners[:,1] = corners[:,1] - corners[:,1].min()

    cloud = cloud[cloud[:,0] < 200,:]

    #check all coordinates are positive. Expect all returns to be 0
    print cloud[:,1].min(), cloud[:,0].min()
    print  len(cloud[cloud[:,0]<0,:]),  len(cloud[cloud[:,1]<0])
  
    np.savetxt('cloudsectTransf.csv', cloud, delimiter=',', header='x,y,z')
    

divideSquares(lasfilename)
