import sys
import os.path
import laspy
import argparse
import numpy as np

class lasStats(object):

    def __init__(self, inputfname, csvfname, decimalchar, recreatecsv, area, verbose):
        self.inputfname = inputfname
        self.csvfname = csvfname
        self.decimalchar = decimalchar
        self.verbose = verbose
        self.recreatecsv = recreatecsv
        self.area = area
        self.csvcolumns='filename;guid;file_source_id;global_encoding;project_id;version;date;system_id;software_id;point_records_count;scale_x;scale_y;scale_z;offset_x;offset_y;offset_z;min_x;min_y;min_z;max_x;max_y;max_z;points_density;intensity_min;intensity_max;intensity_avg;returns_1;returns_2;returns_3;returns_4;returns_5\n'
        try:
            self.inFile = laspy.file.File(self.inputfname, mode = 'r')
        except:
            print("Impossible to open file {0}".format(self.inputfname))
            raise

    def GetLASInfoStr(self):
        s='{0};{1};{2};{3};{4};{5};{6};{7};{8};{9};{10};{11};{12};{13};{14};{15};{16};{17};{18};{19};{20};{21};{22};{23};{24};'.format(
            self.inFile.header.guid,
            self.inFile.header.file_source_id,
            self.inFile.header.global_encoding,
            self.inFile.header.project_id,
            self.inFile.header.version,
            self.inFile.header.date,
            self.inFile.header.system_id.strip('\x00'),
            self.inFile.header.software_id.strip('\x00'),
            self.inFile.header.point_records_count,
            self.inFile.header.scale[0],self.inFile.header.scale[1],self.inFile.header.scale[2],
            self.inFile.header.offset[0],self.inFile.header.offset[1],self.inFile.header.offset[2],
            self.inFile.header.min[0],self.inFile.header.min[1],self.inFile.header.min[2],
            self.inFile.header.max[0],self.inFile.header.max[1],self.inFile.header.max[2],
            float(self.inFile.header.point_records_count) / self.area,
            np.amin(self.inFile.intensity),
            np.amax(self.inFile.intensity),
            np.average(self.inFile.intensity))
            
        for i in range(len(self.inFile.header.point_return_count)):
            s+=str(self.inFile.header.point_return_count[i])+';'
        if self.decimalchar != '.':
            s=s.replace('.',',')
        return s[:-1]

    @staticmethod
    def Header():
        print("LiDAR Stats v0.8")
        print("")

    @staticmethod
    def ProcessCmdLine():
        # python D:\CCST\Software\pyLiDARForest\stuff\lasStats.py d:\CCST\Paper\transects\216\000_slice_norm_filtered_biomass_np_t-216.las d:\CCST\Paper\transects\216\test.csv -a 3801184
        parser = argparse.ArgumentParser(description="Calculate statistcs about LiDAR data.")
        parser.add_argument("inputfname", type=str, 
            help = "LiDAR file to process.")
        parser.add_argument("csvfname", type=str, help = "Destination csv file.")
        parser.add_argument("-d","--decimalchar",help = "Decimal char separator, defaul = '.'",type=str, default='.')
        parser.add_argument("-r","--recreatecsv",help = "Force a new csv file if a csv file already exists.", type = int, default = 0)
        parser.add_argument("-a","--areatransect",help = "Transect area", type = float)
        parser.add_argument("-v","--verbose",help = "Show intermediate messages")
        return parser.parse_args()

    def Execute(self,verbose):
        if self.csvfname != None:
            try:
                if args.recreatecsv:
                    os.remove(self.csvfname)
                csvalreadyexists=os.path.isfile(self.csvfname) 
                if verbose > 0:
                    print("Processing: {0}".format(args.inputfname))    

                with open(self.csvfname,'a') as csv:
                    if verbose > 0:
                        print("Updating: {0}".format(args.csvfname))    
            
                    if not csvalreadyexists:
                        csv.write(self.csvcolumns)
                    line=self.inputfname+';'+self.GetLASInfoStr()
                    csv.write('{0}\n'.format(line))       
                    csv.close()
            except:
                print("Unexpected error:", sys.exc_info()[0])
                raise

    def Close(self):
        self.inFile.close()

if __name__ == "__main__":
    try:
        args=lasStats.ProcessCmdLine()
    except Exception as e:
        print("Unexpected error:", sys.exc_info()[0])
        print e
        sys.exit(1)
    ls = lasStats(args.inputfname,args.csvfname,args.decimalchar,args.recreatecsv,args.areatransect,args.verbose)
    if args.verbose > 0:
        ls.Header()
    ls.Execute(args.verbose)
    ls.Close()
    if args.verbose > 0:
        print('Done.')