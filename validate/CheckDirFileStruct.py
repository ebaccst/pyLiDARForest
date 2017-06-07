# -*- coding: utf-8 -*-
"""
Created on Thu Mar 17 13:28:30 2016

@author: mauro.assis
"""

# In[ ]:

import sys
import argparse
from argparse import RawTextHelpFormatter
import os

def programHeader():
    print("Check Directory/file structure v0.8")
    print("")
    print("Processing...")

def ParseCmdLine():
    try:
        parser = argparse.ArgumentParser(description="Check path & file structure.",formatter_class=RawTextHelpFormatter)
        parser.add_argument("filestruct",help="Directory structure to be checked.")
        parser.add_argument("-r","--root", type=str, help="Root path.")
        parser.add_argument("-v","--verbose", type=int, help="show processing messages.", default = False)
#    parser.add_argument("-m","--masktransect", type=str ,help="Transect subdir mask.") # ex: T_%%%"
        return parser.parse_args()
    except:
        print("Unexpected error:", sys.exc_info()[0])
        raise

def SubDirPath(d):
    return filter(os.path.isdir, [os.path.join(d,f) for f in os.listdir(d)])
    
def CheckFile(root,path,item,transect):
    completefname = "{0}\{1}\{2}".format(root,path.replace("<transect>",transect),item.replace("<transect>",transect))
    return completefname,os.path.isfile(completefname) 

def CheckDirFileStruct():
    args = ParseCmdLine()
    with open(args.filestruct) as f:
        struct = f.readlines()
    subdirs=SubDirPath(args.root)
    therearebugs=False
    for subdir in subdirs:
        transect = subdir[-3:]
        for item in struct:
            item = item.strip()
            if item == "":
                continue
            if item == "[dir]":
                typ = "d"
                continue
            else:
                if item == "[files]":
                    typ = "f"
                    continue
                else:
                    if typ == "d":
                        path = item
                    else:
                        completefname,ok = CheckFile(subdir,path,item,transect)  
                        if args.verbose == 2:
                            print("File: {0} {1}".format(completefname,("Ok" if ok else "doesn´t exists.")))
                        else:
                            if args.verbose == 1:
                                if not ok:
                                    therearebugs=True
                                    print("Transect structure failed. File {0} doesn´t exists.".format(completefname))
                            else:
                                if not ok:
                                    therearebugs=True
                                    print os.path.basename(completefname)
    return therearebugs

def main():
    programHeader()
    if not CheckDirFileStruct():
        print("File structure is ok.")
    print("Program ended.")

if __name__ == "__main__":
    main()