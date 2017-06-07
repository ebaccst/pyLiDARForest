import pyLASTools
import pyForestLASTools 
import argparse

def Header():
    print('Digital Terrain Model generator v0.8')
    print

def ParseCmdLine():
#   D:\CCST\Paper\transects\069\NP_T-069.LAS -lp c:\lastoons\bin -co 0 -v 1 
    parser = argparse.ArgumentParser(description='Generate CHM model.')
    parser.add_argument('-i','--inputfname',help='File mask to be processed.')
    parser.add_argument('-df','--destinationformat',help='BIL, ASC, IMG, TIF, PNG, JPG, XYZ, CSV, or DTM format.', default = 'DTM')
    parser.add_argument('-s','--step', type=float, help='Step.', default = 0.33333)
    parser.add_argument('-lp','--lastoolspath',help=r'LASTools bin path, default c:\lastools\bin', default = r'c:\lastools\bin')
    parser.add_argument('-co','--commandonly', type=int, help = 'Just show commands, withou run it.',default=0)
    parser.add_argument('-v','--verbose', type=int, help = 'Show intermediate messages.',default=0)

    return parser.parse_args()

if __name__ == '__main__':
    Header()

args=ParseCmdLine()
forestLT = pyForestLASTools.pyForestLASTools(inputfname=args.inputfname,rootdir="",tempdir="temp",\
    lastoolspath=args.lastoolspath,commandonly=args.commandonly,verbose=args.verbose)

forestLT.normalize()
forestLT.justground()
forestLT.dtm(step=args.step,extension=args.destinationformat)

forestLT.clear()
