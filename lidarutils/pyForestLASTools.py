# -*- coding: utf-8 -*-
import os
import glob
import argparse
from argparse import RawTextHelpFormatter
import sys
import subprocess
import shutil
import pyLASTools
from pyLASTools import pyLASTools

class pyForestLASTools(object):
    """Implements a Python interface to LASTools command line tools"""
    denoisedsuffix = "_dn"
    groundsuffix = "_g"
    normsuffix = "_n"
    classifysuffix = "_c"
    changeclassifysuffix = "h1_5"
    biomasssuffix = "_biomass"
    thinsuffix = "_th"
    tilesuffix = "_tl"
    bufferremovedsuffix = "_rb"
    chmsuffix = "_chm"
    dtmsuffix = "_dtm"

    def __init__(self,inputfname,outputpath="",rootdir="",tempdir="",lastoolspath=r"c:\lastools\bin",commandonly=0,verbose=0,cores=1):
        self.inputfname = inputfname
        self.outputpath = outputpath
        self.originalfname = self.inputfname
        self.tempdir=tempdir
        self.cores=cores
        if rootdir == "":
            self.rootdir = os.path.dirname(inputfname)+os.sep
        else:
            self.rootdir = rootdir+("" if rootdir.endswith(os.sep) else os.sep)
        self.commandonly = commandonly
        self.verbose = verbose
        self.currentsuffix = ""
        if (self.tempdir != "") and (self.commandonly == 0) and (self.tempdir != self.rootdir):
            self.rmdir(self.tempdir)
            self.mkdir(self.tempdir)
        self.pylastools = pyLASTools(lastoolspath,self.cores)

    def justfilename(self,fname):
        return os.path.basename(fname).split(".")[0]

    def deletefiles(self,filemask):
        for filename in glob.glob(filemask) :
            os.remove(filename)

    def mkdir(self,directory):
        if not os.path.exists(directory):
            os.makedirs(directory)

    def rmdir(self,directory):
        if os.path.exists(directory):
            shutil.rmtree(directory)

    def addsuffix(self,fname,suffix):
        justname,extension = os.path.splitext(fname)
        self.currentsuffix+=suffix
        return "{0}{1}{2}".format(justname,suffix,extension)

    def blast2dem(self,inputfname="",outputfname="",step=0.33333,options=""):
        if inputfname != "":
            self.inputfname = inputfname
        self.pylastools.blast2dem(self.inputfname,outputfname,step,options,self.commandonly,self.verbose)

    def normalize(self):
        outputfname=self.addsuffix(self.inputfname,self.groundsuffix)
        self.pylastools.lasground(self.inputfname,outputfname,"",self.commandonly,self.verbose)
        self.inputfname=outputfname
        outputfname=self.addsuffix(outputfname,self.normsuffix)
        self.pylastools.lasheight(self.inputfname,outputfname,"-replace_z",self.commandonly,self.verbose)
        self.inputfname=outputfname

    def justbiomass(self,options=""):
        outputfname=self.addsuffix(self.inputfname,self.biomasssuffix)
        self.pylastools.las2las(self.inputfname,outputfname,"-keep_z 0 10000 -drop_class 2 {0}".format(options),self.commandonly,self.verbose)
        self.inputfname=outputfname

    def justground(self,options=""):
        outputfname=self.addsuffix(self.inputfname,self.groundsuffix)
        self.pylastools.las2las(self.inputfname,outputfname,"-keep_z 0 10000 -keep_class 2 {0}".format(options),self.commandonly,self.verbose)        
        self.inputfname=outputfname

    def split(self,outputfname,tilesize=500,buffer=10,options=""):
        self.pylastools.lastile(self.inputfname,outputfname,"-odix {0} {1} -tile_size {2} -olaz -buffer {3}".format(self.tilesuffix,options,tilesize,buffer),self.commandonly,self.verbose)

    def thin(self,inputfname="",outputfname="",tilesize=500,buffer=10,step=0.33333,subcircle=0.05,options=""):
        originputfname=self.inputfname
        if outputfname == "":
            self.split("{0}{1}".format(self.tempdir,os.path.basename(self.inputfname)),tilesize,buffer)
        options+="-step {0} -highest -subcircle {1} -olaz {2} -odix {3}".format(step,subcircle,options,self.thinsuffix)
        if inputfname != "":
            self.inputfname=inputfname
        else:
            self.inputfname="{0}*.laz".format(self.tempdir)
        self.pylastools.lasthin(self.inputfname,outputfname,options,self.commandonly,self.verbose)
        self.removebuffer()
        self.merge("{0}*{1}.laz".format(self.tempdir,self.bufferremovedsuffix),self.addsuffix(originputfname,self.thinsuffix))
    
    def removebuffer(self,inputfname="",outputfname="",options=""):
        if inputfname == "":
            inputfname=self.tempdir+"*{0}.laz".format(self.thinsuffix)
        self.pylastools.lastile(inputfname,outputfname,"-remove_buffer {0} -olaz -odix {1}".format(options,self.bufferremovedsuffix),self.commandonly,self.verbose)
        self.inputfname=outputfname

    def merge(self,inputfname,outputfname="",options=""):
        self.pylastools.lasmerge(inputfname,outputfname,options,self.commandonly,self.verbose)
        self.inputfname=outputfname

    def dtm(self,outputfname="",extension="dtm",step=0.33333,options=""):
        outputfname=os.path.splitext(self.originalfname)[0]+self.dtmsuffix+"."+extension
        if (extension.upper() == "PNG") or (extension.upper() == "TIF"):
             options+="-false -compute_min_max"
        self.blast2dem(self.inputfname,outputfname,step=step,options=options)

    def chm(self,extension="dtm",step=0.33333,options=""):
        outpath=os.path.dirname(self.originalfname)+os.sep
        self.blast2dem(outputfname=outpath+"chm_00.bil",step=step,options="-kill 1.0")
        self.blast2dem(outputfname=outpath+"chm_02.bil",step=step,options="-kill 1.0 -drop_z_below 2")
        self.blast2dem(outputfname=outpath+"chm_05.bil",step=step,options="-kill 1.0 -drop_z_below 5")
        self.blast2dem(outputfname=outpath+"chm_10.bil",step=step,options="-kill 1.0 -drop_z_below 10")
        self.blast2dem(outputfname=outpath+"chm_15.bil",step=step,options="-kill 1.0 -drop_z_below 15")
        self.blast2dem(outputfname=outpath+"chm_20.bil",step=step,options="-kill 1.0 -drop_z_below 20")
        self.blast2dem(outputfname=outpath+"chm_25.bil",step=step,options="-kill 1.0 -drop_z_below 25")
        outputfname=os.path.splitext(self.originalfname)[0]+self.chmsuffix+"."+extension
        inputfname=self.rootdir+"chm*.bil"
        if (extension.upper() == "PNG") or (extension.upper() == "TIF"):
            options+="-false -compute_min_max"
        self.pylastools.lasgrid(inputfname,outputfname,step,options)

    def metrics(self,extension="csv",step=20.0,\
          metrics="",options=""):
        if metrics == "":
            raise ValueError("It´s mandatory to inform metrics to be calculated.")
        inputfname=self.inputfname
        outputfname=self.outputpath+os.path.split(os.path.splitext(self.originalfname)[0]+"."+extension)[1]
        nextfname=self.outputpath+self.addsuffix(os.path.split(inputfname)[1],self.denoisedsuffix)
        self.pylastools.lasnoise(inputfname,nextfname,"-olaz -remove_noise",self.commandonly,self.verbose)
        inputfname=nextfname
        nextfname=self.addsuffix(inputfname,self.groundsuffix)
        self.pylastools.lasground(inputfname,nextfname,"-olaz",self.commandonly,self.verbose)
        inputfname=nextfname
        nextfname=self.addsuffix(inputfname,self.normsuffix)
        self.pylastools.lasheight(inputfname,nextfname,"-olaz -store_in_user_data -replace_z",self.commandonly,self.verbose)
        inputfname=nextfname
        nextfname=self.addsuffix(inputfname,self.classifysuffix)
        self.pylastools.lasclassify(inputfname,nextfname,"-olaz",self.commandonly,self.verbose)
        inputfname=nextfname
        nextfname=self.addsuffix(inputfname,self.changeclassifysuffix)
        self.pylastools.lasclassify(inputfname,nextfname,"-olaz -change_classification_from_to 1 5",self.commandonly,self.verbose)

        self.pylastools.lascanopy(inputfname=nextfname,outputfname=outputfname,step=step,options="{0} {1}".format(metrics,options),commandonly=self.commandonly,verbose=self.verbose)

    def clear(self):
        if (self.tempdir == ""):
            self.rmdir(self.tempdir)
            self.deletefiles(self.rootdir+"chm*.*")

