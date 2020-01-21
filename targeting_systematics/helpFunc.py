import pandas as pd
import healpy as hp
import numpy as np

import matplotlib.pyplot as plt

def plot_hpix(hp_table, nside, label, region=None, **kwargs):
    """
    data: Pandas or astropy table containing the data with hp_idx column
    nside: number of sides of the pixel
    label: label of the column to be plotted as a hp map
    region: survey region to be selected
    """
    npix = hp.nside2npix(nside)
    hp_array = hp.ma(np.zeros(npix))
    hp_array[np.array(hp_table['hp_idx'])] = np.array(hp_table[label])
    hp_mask = np.zeros(npix, dtype=bool)
    
    if region == None:
        hp_mask[hp_table['hp_idx']] = True
    else:
        hp_mask[hp_table['hp_idx'][hp_table['region']!=region]] = True
        
    hp_array.mask = ~hp_mask
    
    tmp = hp.mollview(hp_array, xsize=4000,rot=(120,0,0), return_projected_map=True)
    plt.close()
    
    # Remove outlying regions
    tmp = np.ma.masked_array(tmp.data[600:], mask=tmp.mask[600:])
    tmp = np.ma.masked_array(tmp.data[::, 300:], mask=tmp.mask[::, 300:])
    
    fig, ax = plt.subplots(figsize=(25, 10))
    im = ax.imshow(tmp, origin='lower', vmin=-0.3, vmax=0.2, cmap="jet")
    ax.axis('off')
    cax = fig.add_axes([0.9, 0.15, 0.015, 0.7])
    fig.colorbar(im, cax=cax)
    fig.set_facecolor('lightgrey')
    plt.show()
    
    return hp_array