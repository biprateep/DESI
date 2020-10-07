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
    desi_compute_bias -i "${zeroFiles[@]}" -o /global/cfs/cdirs/desi/users/bid13/desi_masks_dark/bias-$cam.fits --camera $cam

done
