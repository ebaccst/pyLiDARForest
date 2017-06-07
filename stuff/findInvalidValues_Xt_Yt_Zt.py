# -*- coding: utf-8 -*-
import os
import argparse
from argparse import RawTextHelpFormatter
import sys
sys.path.append(r"..\lidarutils")
import numpy as np
import lidarutils

import fnmatch
import time

import laspy
import lasFWF
        
def Header():
    print("Find invalid values v0.8")
    print

def ParseCmdLine():
    parser = argparse.ArgumentParser(description="Find invalid values.",formatter_class=RawTextHelpFormatter)
    parser.add_argument("inputfname",help="las file to be processed.")
    parser.add_argument("-t","--tcoefficientvalues", help="Find X(t), Y(t), Z(t) inconsistent coefficient values.", default = None)
    return parser.parse_args()

if __name__ == "__main__":
    Header()
    args=ParseCmdLine()
    inFile = lasFWF.FWFFile(args.inputfname, mode = "r")
    invalid = np.logical_not(np.isfinite(inFile.x_t))
    pointsNotValid = inFile.points[invalid]
    for i in range(len(pointsNotValid)):
        fwfdata = inFile.GetFWFData(pointsNotValid[i][0][11],pointsNotValid[i][0][12]) 
        print pointsNotValid[i][0][0],pointsNotValid[i][0][1],pointsNotValid[i][0][2],
        for index,item in enumerate(fwfdata):
            print ord(item),
        print
                    

