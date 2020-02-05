import json
from pathlib import Path

import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import iqr
from astropy.io import fits

from desispec.preproc import preproc


class exposure_utils(object):
    """Produce preprocessed stacks and other statistical fquantities of CCD exposures
    Args:
        file_list (str): path to text file containing the directories having the required exposures
        out_dir (str): output directory to save the stacked arrays
    Returns:
    """

    def __init(self, file_list=None, out_dir=None):
        self.file_list = Path(file_list)
        self.out_dir = Path(out_dir)
        self.channels = [
            i + j for i in ["B", "R", "Z"] for j in np.arange(10).astype(str)
        ]  # Define the channel names

    def create_stacks(self, statistics=True, readnoise_concise=True, **preproc_args):
        """creates and stacks of DESI CCD images
        Args:
        statistics (bool): Whether to save stacked statistics
        readnoise_concise (bool): whether to save full read noise or ampwise readnoise
        **preproc_args: All arguments passed on to desi spec preproc command
        """
        img_dirs = np.loadtxt(self.file_list, dtype=str)
        img_dirs = [Path(dir) for dir in img_dirs]

        for channel in self.channels:
            print(channel)
            if readnoise_concise:
                data_noise = np.zeros(
                    (len(img_dirs), 2, 2)
                )  # Read noise is saved as only the four amplifier values

            if channel[0] == "B":
                data_cube = np.zeros((len(img_dirs), 4096, 4096))
                if not readnoise_concise:
                    data_noise = np.zeros((len(img_dirs), 4096, 4096))
            if channel[0] in ["R", "Z"]:
                data_cube = np.zeros((len(img_dirs), 4128, 4114))
                if not readnoise_concise:
                    data_noise = np.zeros((len(img_dirs), 4128, 4114))

            for ind, img_dir in enumerate(img_dirs):
                exposure = img_dir.parts[-1]
                img_path = img_dir / ("/desi-" + exposure + ".fits.fz")
                prim_header_path = img_dir / ("request-" + exposure + ".json")

                img_hdul = fits.open(img_path)

                with open(prim_header_path) as f:
                    primary_header = json.load(f)

                proc_img = preproc(
                    img_hdul[channel].data,
                    img_hdul[channel].header,
                    primary_header,
                    bias=False,
                    dark=False,
                    pixflat=False,
                    mask=False,
                    nocosmic=True,
                    nocrosstalk=True,
                    nogain=False,
                    ccd_calibration_filename=False,
                )
            data_cube[ind] = proc_img.pix

            if readnoise_concise:
                data_noise[ind][0, 0] = proc_img.readnoise[1000, 1000]
                data_noise[ind][0, 1] = proc_img.readnoise[1000, 3000]
                data_noise[ind][1, 0] = proc_img.readnoise[3000, 1000]
                data_noise[ind][1, 1] = proc_img.readnoise[3000, 3000]
            else:
                data_noise[ind] = proc_img.readnoise

        if statistics:
            median_arr = np.median(ccd, axis=0)
            np.save(self.out_dir / (channel + "_median"), median_arr)

            iqr_arr = iqr(ccd, axis=0)
            np.save(self.out_dir / (channel + "_iqr"), iqr_arr)

        np.save(self.out_dir + channel, data_cube)
        np.save(self.out_dir + channel + "_readnoise", data_noise)

        return None


if __name__ == "main":
    file_list = "/global/u2/b/bid13/spectrograph/zero_paths.txt"
    out_dir = "/global/cscratch1/sd/bid13/spectra_stacks/zero_stacks/"
    utils = exposure_utils(file_list=file_list, out_dir=out_dir)
    utils.create_stacks(statistics=True, readnoise_concise=True)
