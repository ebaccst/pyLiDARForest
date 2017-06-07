# -*- coding: utf-8 -*-
"""
Rename transects dir/files inserting 0 before the transect number

Created on Dec 8 13:28:30 2016

@author: mauro.assis
"""

import sys
import os.path
import re
import fnmatch

def FindFiles(directory, pattern):
    flist=[]
    for root, dirs, files in os.walk(directory):
        for filename in fnmatch.filter(files, pattern):
            flist.append(os.path.join(root, filename))
    return flist

def Header():
    print("Rename transects dir/files inserting 0 before the transect number v0.8")
    print("")
    print("Processing...")

if __name__ == '__main__':
    Header()

    root = r'H:\TRANSECTS'
    filemask = '*.*'

    files=FindFiles(root,filemask)
    for file in files:
        justname=os.path.basename(file)
        p=justname.find('-')+1
        if p == 0:
            continue
        i=0
        while '0123456789'.find(justname[p+i]) != -1:
            i+=1
        if i == 3:
            newname=os.path.dirname(file)+'\\'+justname.replace("-","-0")
            print file, newname
            os.rename(file,newname)
    temp = os.walk(root, topdown=False)
    for r, dirs, files in temp:
        for d in dirs:
            p=d.find('-')+1
            if p == 0:
                continue
            i=0
            try:
                while ((p+i < len(d) and '0123456789'.find(d[p+i])  != -1)):
                    i+=1
                if i == 3:
                    newname=os.path.join(r,d.replace("-","-0"))
                    os.rename(os.path.join(r,d),newname)
            except:
                print "Error processing: {0}".format(d)
print 