"""
Script to flag bad pixels from the pixel level flats
"""
from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt
from astropy.io import fits
from astropy.nddata import CCDData
from astropy.convolution import convolve, Box2DKernel, Box1DKernel
import ccdproc
import json
from scipy.stats import iqr
from scipy.ndimage import median_filter
import glob
import imexam

plt.rcParams["figure.figsize"] = (16, 8)

