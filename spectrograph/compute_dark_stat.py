#!/usr/bin/env python


import sys,string
import astropy.io.fits as pyfits
import argparse
import numpy as np
from scipy.stats import iqr

from desispec import io
from desiutil.log import get_logger



parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter,
                                 description="Compute stacked statistics for dark",
                                 epilog='''
                                 Input is a list of raw dark images (Possibly with different exposure times).
                                 Raw images are preprocessed with ONLY gain (if available) and bias corrections and calculated per unit time.                                  The result is the median and IQR of the preprocessed images. 
                                 These statistics are used to create the pixel masks''')

# CHANGE THESE
parser.add_argument('-i','--image', type = str, default = None, required = True, nargs="*",
                    help = 'path of raws image fits files')
parser.add_argument('-o','--outfile', type = str, default = None, required = True,
                    help = 'output image filename')
parser.add_argument('--camera',type = str, required = True,
                    help = 'header HDU (int or string)')
parser.add_argument('--bias', type = str, default = None, required=True,
                        help = 'bias image calibration file')

args = parser.parse_args()
log = get_logger()

log.info("read images ...")

shape=None
images=[]


for filename in args.image :

    log.info(filename)

    # collect exposure times
    fitsfile=pyfits.open(filename)
    primary_header = fitsfile[0].header
    if not "EXPTIME" in primary_header :
        primary_header = fitsfile[1].header
    exptime = primary_header["EXPTIME"]
    fitsfile.close()

    # read raw data and preprocess them
    img = io.read_raw(filename, args.camera,
                      bias=args.bias,
                      nogain=False,
                      nocosmic=True,
                      mask=False,
                      dark=False,
                      pixflat=False,
                      nocrosstalk=True,
                      ccd_calibration_filename=False)

    shape=img.pix.shape
    log.info("adding dark %s divided by exposure time %f s"%(filename,exptime))
    images.append(img.pix/exptime)
    
images=np.array(images)


log.info("compute median image ...")
med_image = np.median(images, axis=0)
log.info("computed median image ...")

log.info("compute IQR image ...")
iqr_image = iqr(images, axis=0)

log.info("writing output to %s ..."%args.outfile)
hdulist=pyfits.HDUList([pyfits.PrimaryHDU(), pyfits.ImageHDU(med_image, name="MEDIAN"), pyfits.ImageHDU(iqr_image, name="IQR")])

#Write header info
for i, filename in enumerate(args.image) :
    hdulist[0].header["INPUT%03d"%i]=filename
hdulist[0].header["CAMERA"]=args.camera
hdulist[0].header["NUMEXP"]=len(args.image)

hdulist.writeto(args.outfile, overwrite=True)
log.info("done")