"""
Generate pixel masks from pix-flats
"""
import glob
from pathlib import Path

import numpy as np
import matplotlib.pyplot as plt
from astropy.io import fits
from astropy.convolution import convolve, Box2DKernel, Box1DKernel
from scipy.stats import iqr
from scipy.ndimage import median_filter

data_path = Path("/data/bid13/desi/spectrograph/pixflats")
data_out = Path("/home/bid13/code/DESI/spectrograph/results")

flat_dirs = glob.glob(str(data_path)+"/sm*")

#loop over the directories
for dir_count, flat_dir in enumerate(flat_dirs):
    #loop over the colors
    for color_count, color in enumerate(["b","r","z"]):
        
        flat_files=glob.glob(flat_dir+"/preproc-"+color+"*")
        num_exposures = len(flat_files)
        
        #Declare zero arrays based on chip sizes
        if color == "b":
            size = (num_exposures, 4096,4096)
        if color in ["r","z"]:
            size = (num_exposures, 4128, 4114)
        all_data = np.zeros(size)
        all_ivar = np.zeros(size)

        #Loop over the files to read
        for count, name in enumerate(flat_files):
            all_data[count] = (fits.open(name)["IMAGE"].data)
            all_ivar[count] = (fits.open(name)["IVAR"].data)
        
        #STEP-1 Mask bad columns at the edges
        
        #Calculate medianflux as function of column
        median_flat = np.median(all_data, axis=0)
        median_col = np.median(median_flat, axis=0)
        log_median = np.log(median_col-np.min(median_col)+1)
        log_median[np.isneginf(log_median)] = 0
        gradient = np.gradient(log_median)
        if color == "b":
            left_edge = np.argmax(gradient[10:400])+10 #End included
            right_edge = len(gradient)-400+np.argmin(gradient[-400:-10])+1 #End not included
        if color == "r":
            left_edge = np.argmax(gradient[80:160])+80 #End included
            right_edge = len(gradient)-400+np.argmin(gradient[-400:-10])+1 #End not included
        if color == "z":
            left_edge = np.argmax(gradient[10:400])+10 #included
            right_edge = len(gradient)-400+np.argmin(gradient[-400:-100])+1 #Not included
            
        #Just to debug
#         name = flat_dir.split("/")[-1].split("-")[0] + color
#         print(name)
#         plt.figure()
#         plt.plot(median_col, marker = "o", ls ="")
#         plt.axvline(left_edge)
#         plt.xlim(left_edge-20, left_edge+20)
#         plt.yscale("log")
#         plt.savefig(data_out/(name+"_left.png"))
#         plt.close()
        
#         plt.figure()
#         plt.plot(median_col, marker = "o", ls ="")
#         plt.axvline(right_edge-1)
#         plt.xlim(right_edge-20, right_edge+20)
#         plt.yscale("log")
#         plt.savefig(data_out/(name+"_right.png"))
#         plt.close()
        
        