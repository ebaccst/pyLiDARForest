'''
T-410: floresta propical densa aberta
T-358: floresta tropical densa fechada
T-216: cerrado/mata de galeria (*)
T-069: Bamboo Forest
T_333: Flooded
'''
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.cbook as cbook
import laspy

class lasC(object):
    fig = None
    def __init__(self,lasfname,csvfname,foresttype):
        try:
            self.foresttype=foresttype
            self.inFile = laspy.file.File(lasfname, mode = 'r')
            self.csv=np.genfromtxt(csvfname, delimiter=';',names=True)
        except:
            print("Impossible to open file {0}".format(self.inputfname))
            raise

    def plot(self,xcolumn,ycolumn,xlabel,ylabel,ax):
        ax.set_xlabel(xlabel)
        ax.set_ylabel(ylabel)
        ax.plot(xcolumn,ycolumn,label=self.foresttype)

    def stackplot(self,xcolumn,ycolumn,xlabel,ylabel,ax):
        ax.set_xlabel(xlabel)
        ax.set_ylabel(ylabel)
        ax.stackplot(xcolumn,ycolumn)

fields = ('point_records_count','returns_1','returns_2','returns_3')

files = [(lasC(r'D:\CCST\Paper\transects\069\NP_T-069_ground_norm_biomass.las',r'D:\CCST\Paper\069verticalmetrics.csv','Bamboo forest')),\
         (lasC(r'D:\CCST\Paper\transects\216\NP_T-216_ground_norm_biomass.las',r'D:\CCST\Paper\216verticalmetrics.csv','Cerrado/galeria')),\
         (lasC(r'D:\CCST\Paper\transects\333\NP_T-333_ground_norm_biomass.las',r'D:\CCST\Paper\333verticalmetrics.csv','Flooded')),\
         (lasC(r'D:\CCST\Paper\transects\358\NP_T-358_ground_norm_biomass.las',r'D:\CCST\Paper\358verticalmetrics.csv','Closed dense')),\
         (lasC(r'D:\CCST\Paper\transects\410\NP_T-410_ground_norm_biomass.las',r'D:\CCST\Paper\410verticalmetrics.csv','Open dense'))]

def plotIntensity():
    lasC.fig = plt.figure()
    plt.suptitle('Intensity')
    for las in files:
        ts=np.less_equal(las.csv['intensity_avg'],300)
        filtered=las.csv[ts]
        plt.plot(filtered['intensity_avg'],filtered['max_z'],label=las.foresttype)
    plt.legend()
    plt.show()

def plotTotal():
    lasC.fig = plt.figure()
    plt.suptitle('Number of points')
    pos = 221
    for field in fields:
        ax = lasC.fig.add_subplot(pos)
        for las in files:
            las.plot(las.csv[field],las.csv['max_z'],field,'height (m)',ax)
        ax.legend()
        pos+=1
    plt.show()

def plotTotalAccmum():
    lasC.fig = plt.figure()
    plt.suptitle('Number of accumulated')
    pos = 221
    for field in fields:
        ax = lasC.fig.add_subplot(pos)
        for las in files:
            cummulative = np.cumsum(las.csv[field])
            las.plot(las.csv['max_z'],cummulative,'height (m)',field,ax)
        ax.legend(fontsize='x-small',loc=4)
        pos+=1
    plt.show()

def plotPercentTotal():
    lasC.fig = plt.figure()
    plt.suptitle('% of total returns')
    pos = 221
    for field in fields:
        ax = lasC.fig.add_subplot(pos)
        for las in files:
            las.plot(las.csv[field]/las.inFile.header.point_records_count*100.0,las.csv['min_z'],field,'height (m)',ax)
        ax.legend()
        pos+=1
    plt.show()

def plotPercentReturn():
    lasC.fig = plt.figure()
    plt.suptitle('% of de corresponding total returns')

    pos = 221
    i=-1
    for field in fields:
        ax = lasC.fig.add_subplot(pos)
        for las in files:
            if field == 'point_records_count':
                las.plot(las.csv[field]/las.inFile.header.point_records_count*100.0,las.csv['min_z'],field,'height (m)',ax)
            else:
                las.plot(las.csv[field]/las.inFile.header.point_return_count[i]*100.0,las.csv['min_z'],field,'height (m)',ax)
        i+=1
        ax.legend()
        pos+=1
    plt.show()

if __name__ == "__main__":
    plotTotal()
    plotTotalAccmum()
    plotPercentTotal()
    plotPercentReturn()
    plotIntensity()