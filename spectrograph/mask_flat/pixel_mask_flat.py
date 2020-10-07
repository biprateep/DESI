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

#loop over the colors
for color_count, color in enumerate(["b","r","z"]):
    #loop over the directories
    for dir_count, flat_dir in enumerate(flat_dirs):
        spec_name = flat_dir.split("/")[-1].split("-")[0] + color
        
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
            
        #Plots to debug
        """
        print(spec_name)
        plt.figure()
        plt.plot(median_col, marker = "o", ls ="")
        plt.axvline(left_edge)
        plt.xlim(left_edge-20, left_edge+20)
        plt.yscale("log")
        plt.savefig(data_out/(spec_name+"_left.png"))
        plt.close()
        
        plt.figure()
        plt.plot(median_col, marker = "o", ls ="")
        plt.axvline(right_edge-1)
        plt.xlim(right_edge-20, right_edge+20)
        plt.yscale("log")
        plt.savefig(data_out/(spec_name+"_right.png"))
        plt.close()
        """
        
        #STEP-2 Mask statistical outliers in image
        
        #Focus on the middles section now
        all_data = all_data[:,:,left_edge:right_edge]
        all_ivar = all_ivar[:,:,left_edge:right_edge]
        filtered_data = np.zeros(all_data.shape)
        
        #median filter the data to get a smooth background
        for count in range(num_exposures):
            filtered_data[count] = median_filter(all_data[count], size=(1,21))
        #Divide the raw data by the smoothed data to amplify the outliers
        div_img = all_data/filtered_data
        
        #Get the errors on the measurements for each pixel
        
        #Propagate the observed Ivar to find a sigma
        scaled_ivar = all_ivar*(filtered_data)**2
        sigma_img = 1.253*np.sqrt(1/np.sum(scaled_ivar, axis =0))
        
        #Find error using IQR along the time axis
        iqr_img = iqr(div_img, axis=0) #IQR of scaled image
        kernel = Box2DKernel(5)
        smooth_iqr = convolve(iqr_img, kernel)
        #Convert Smoothed IQR into sigma
        #For gaussian IQR = 1.34896 sigma
        #Also sigma_median = 1.253 sigma/sqrt(N)
        sigma_iqr_img = (1.253*smooth_iqr)/(1.34896*np.sqrt(num_exposures))
        
        #Take the maximum of both the errors
        sigma = np.maximum(sigma_img,sigma_iqr_img)
        
        #Find the median of the image across time
        median_div_img = np.median(div_img, axis=0)
        # Define the excess
        outlier_img = (median_div_img-1)/sigma
        
        #Plots to debug
        plt.figure(num=1, figsize=(16,8))
        plt.hist(outlier_img.ravel(), bins=1000, histtype="step")
        print(spec_name)
        plt.xlim(-50,50)
        plt.yscale("log")
        plt.grid()
        plt.savefig(data_out/(spec_name+"_excess.png"))
        plt.close()
        
        plt.figure(num=2, figsize=(18,8))
        plt.hist(outlier_img.ravel(), bins=1000, histtype="step", label=spec_name)
        np.save("/data/bid13/desi/spectrograph/pixmask/dey/"+(spec_name+"_"+str(left_edge)+"_"+str(right_edge)), outlier_img)
    plt.xlim(-100,100)
    plt.yscale("log")
    plt.grid()
    plt.legend()
    plt.savefig(data_out/(color+"_excess.png"))
    plt.close()
    
        