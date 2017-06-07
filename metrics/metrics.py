# -*- coding: utf-8 -*-
import pyLASTools
import pyForestLASTools 
import argparse
import sys

def Header():
    print('Calculate metrics using LASTools v0.8')
    print

def ParseCmdLine():
#   D:\CCST\Paper\transects\069\NP_T-069.LAS -step 20 -lp c:\lastools\bin -metrics "-p 5 10 25 50 75 90 -b 5 10 25 50 75 90 -min -max- avg -std -ske -kur -qav -cov -dns -c 0.5 2 4 10 20 50 -d 0.5 2 4 10 20 50" -fo ASC -co 1 -v 1
#   D:\CCST\Paper\transects\069\NP_T-069.LAS -o D:\CCST\Paper\transects\069\069LTmetrics.csv  -lp 'c:\lastools\bin' -co 0 -v 1  
    parser = argparse.ArgumentParser(description='Calculate transect metrics.')
    parser.add_argument('inputfname',help='File mask to be processed.')
    parser.add_argument('-op','--outputpath',help='Output file path.',default="")
    parser.add_argument('-df','--destinationformat',help='CSV, BIL, ASC, IMG, TIF, XYZ, FLT, or DTM format, default CSV.', default = 'CSV')
    parser.add_argument('-lp','--lastoolspath',help=r'LASTools bin path, default c:\lastools\bin', default = r'c:\lastools\bin')
    parser.add_argument('-s','--step',help='Side length of grid',type=float, default = 20)
#    parser.add_argument('-m','--metrics', help = 'Metrics to be calculated.',default="")
#    parser.add_argument('-opt','--options', help = 'Additional options.',default="")
    parser.add_argument('-co','--commandonly', type=int, help = 'Just show commands, withou run it.',default=0)
    parser.add_argument('-v','--verbose', type=int, help = 'Show intermediate messages.',default=0)

    try:
        return parser.parse_args()
    except:
        print("Unexpected error:", sys.exc_info()[0])
        raise

if __name__ == '__main__':
    Header()

    args=ParseCmdLine()
    forestLT = pyForestLASTools.pyForestLASTools(inputfname=args.inputfname,outputpath=args.outputpath,rootdir="",\
    lastoolspath=args.lastoolspath,commandonly=args.commandonly,verbose=args.verbose)
    try:
        metrics='-all -min -max -avg -std -ske -kur -qav -p 1 5 10 25 50 75 90 95 99 -b 10 20 30 40 50 60 70 80 90 -c 0 1.3 5 10 20 30 50 -d 0 1.3 5 10 20 30 50  -int_min -int_max -int_avg -int_std -int_ske -int_kur -int_qav -int_p 1 5 10 25 50 75 90 95 99'
        options='-cov -dns -gap -cover_cutoff 1.3 -height_cutoff 1.3'
        forestLT.metrics(extension=args.destinationformat,step=args.step,metrics=metrics,options=options)
    except:
        print("Unexpected error:", sys.exc_info()[0])
        raise
