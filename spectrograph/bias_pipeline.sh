#!/usr/bin/env bash

#Generate the names of the cameras
cameras=()

for c in "B" "R" "Z"; do

    for i in {0..9}; do
        name="${c}${i}"
        cameras+=($name)
    done

done

#read in the names for zeros
mapfile -t zeroFiles < zero_paths_20200209.txt

#Create master bias file
for cam in "${cameras[@]}"; do
    echo $cam
    python desi_compute_bias.py -i "${zeroFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --camera $cam

done


#read in the names for darks
mapfile -t darkFiles < dark_paths_20200209.txt

#Create stacks of darks
for cam in "${cameras[@]}"; do
    echo $cam
    python desi_compute_dark_stat.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits
done