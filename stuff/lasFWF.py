# -*- coding: utf-8 -*-
import os
import fnmatch
import laspy
import numpy as np
import subprocess
import shapefile
import shutil
import tempfile

class FWFFile(laspy.file.File):
    def __init__(self, filename,
                   header=None,
                   vlrs=False,
                   mode='r',
                   in_srs=None,
                   out_srs=None,
                   evlrs = False):
        self.fwffilename=os.path.splitext(filename)[0]+'.wdp'
        self.fwfsize=os.path.getsize(self.fwffilename)
        self.fwffile=open(self.fwffilename,mode='r')
        super(FWFFile,self).__init__(filename,header,vlrs,mode,in_srs,out_srs,evlrs)

    def GetFWFData(self,index=-1,position=-1,length=-1):
        if (index == -1):
            self.fwffile.seek(position, os.SEEK_SET)
            return np.fromfile(self.fwffile,dtype=np.int16,count=length)
        else:
            self.fwffile.seek(self.byte_offset_to_waveform_data[index], os.SEEK_SET)
            return np.fromfile(self.fwffile,dtype=np.int16,count=self.waveform_packet_size[index] / 2)

    def close(self,ignore_header_changes=False,minmax_mode='scaled'):
        self.fwffile.close()
        super(FWFFile, self).close(ignore_header_changes,minmax_mode)