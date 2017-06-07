import lasFWF
import numpy as np
from matplotlib import pyplot

# Open FWF LAS and WDP files
fwf=lasFWF.FWFFile(r'D:\CCST\Paper\transects\358\NP_T-358_FWF.las')

# Index indicates the index of discrete point to use in GetFWFData
index=10028
# Returns a numpy arry containing FWF data corresponding to index
y=fwf.GetFWFData(index)
# create X axis values to plot
x=np.linspace(0,len(y),len(y))
# plot graphic
pyplot.figure(figsize=(30,18))
pyplot.plot(x, y)
pyplot.title("Full Waveform")
pyplot.show()
# close FWF file
fwf.close()