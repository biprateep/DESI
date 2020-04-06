#read in the names for darks
mapfile -t darkFiles < dark_paths_20200209.txt

cam="B0"
minmed=-0.01
maxmed=0.037
miniqr=0
maxiqr=0.018

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="B1"
minmed=-0.009
maxmed=0.026
miniqr=0.0008
maxiqr=0.018

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="B2"
minmed=-0.008
maxmed=0.035
miniqr=0.0008
maxiqr=0.016

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="B3"
minmed=-0.009
maxmed=0.033
miniqr=0.0008
maxiqr=0.016

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="B4"
minmed=-0.01
maxmed=0.031
miniqr=0.0008
maxiqr=0.0185

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="B5"
minmed=-0.009
maxmed=0.0365
miniqr=0.0007
maxiqr=0.0185

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="B6"
minmed=-0.009
maxmed=0.0255
miniqr=0.0007
maxiqr=0.017

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="B7"
minmed=-0.007
maxmed=0.031
miniqr=0.0007
maxiqr=0.0145

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="B8"
minmed=-0.009
maxmed=0.031
miniqr=0.0007
maxiqr=0.017

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="B9"
minmed=-0.009
maxmed=0.031
miniqr=0.0007
maxiqr=0.018

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="R0"
minmed=-0.006
maxmed=0.006
miniqr=0
maxiqr=0.014

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="R1"
minmed=-0.008
maxmed=0.006
miniqr=0
maxiqr=0.012

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="R2"
minmed=-0.5
maxmed=30
miniqr=0
maxiqr=3

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="R3"
minmed=-0.007
maxmed=0.01
miniqr=0
maxiqr=0.013

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="R4"
minmed=-0.005
maxmed=0.006
miniqr=0
maxiqr=0.009

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits


cam="R5"
minmed=-5
maxmed=10
miniqr=0
maxiqr=0.5

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="R6"
minmed=-0.008
maxmed=0.008
miniqr=0
maxiqr=0.014

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="R7"
minmed=-0.005
maxmed=0.005
miniqr=0
maxiqr=0.008

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="R8"
minmed=-0.005
maxmed=0.005
miniqr=0
maxiqr=0.009

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="R9"
minmed=-0.006
maxmed=0.006
miniqr=0
maxiqr=0.009

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="Z0"
minmed=-0.006
maxmed=0.007
miniqr=0
maxiqr=0.01

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="Z1"
minmed=-0.006
maxmed=0.007
miniqr=0
maxiqr=0.013

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="Z2"
minmed=-0.006
maxmed=0.007
miniqr=0
maxiqr=0.01

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="Z3"
minmed=-0.006
maxmed=0.007
miniqr=0
maxiqr=0.012

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="Z4"
minmed=-0.006
maxmed=0.007
miniqr=0
maxiqr=0.012

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="Z5"
minmed=-0.005
maxmed=0.007
miniqr=0
maxiqr=0.08

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="Z6"
minmed=-0.006
maxmed=0.007
miniqr=0
maxiqr=0.012

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="Z7"
minmed=-0.007
maxmed=0.006
miniqr=0
maxiqr=0.013

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="Z8"
minmed=-0.007
maxmed=0.006
miniqr=0
maxiqr=0.01

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits

cam="Z9"
minmed=-0.007
maxmed=0.006
miniqr=0
maxiqr=0.01

python desi_compute_mask_dark.py -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-$cam.fits
