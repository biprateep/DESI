#HACK TO USE CUSTOM PACKAGE
module purge
source /global/common/software/desi/desi_environment.sh master
module unload desispec
export PYTHONPATH=$HOME/desispec/py/:$PYTHONPATH
export PATH=$HOME/desispec/bin:$PATH
export DESI_SPECTRO_CALIB=/global/cfs/cdirs/desi/spectro/desi_spectro_calib/trunk
#read in the names for dark

mapfile -t darkFiles < dark_paths_20200209.txt

cam="B0"
minmed=0.000000
maxmed=99.9849796295166
miniqr=0.0
maxiqr=99.98810291290283

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_test/dark-stat-$cam.fits

cam="B1"
minmed=0.00014901161193847656
maxmed=99.99498724937439
miniqr=5.364418029785156e-05
maxiqr=99.99542832374573

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_test/dark-stat-$cam.fits

cam="B2"
minmed=5.9604644775390625e-05
maxmed=99.99713897705078
miniqr=2.9802322387695312e-05
maxiqr=99.99812841415405

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_test/dark-stat-$cam.fits

cam="B3"
minmed=5.9604644775390625e-06
maxmed=99.99526143074036
miniqr=1.7881393432617188e-05
maxiqr=99.99605417251587

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_test/dark-stat-$cam.fits

cam="B4"
minmed=0.00057220458984375
maxmed=99.99844431877136
miniqr=1.1920928955078125e-05
maxiqr=99.99983310699463

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_test/dark-stat-$cam.fits

cam="B5"
minmed=3.5762786865234375e-05
maxmed=99.99638199806213
miniqr=1.1920928955078125e-05
maxiqr=99.99775886535645

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_test/dark-stat-$cam.fits

cam="B6"
minmed=1.1920928955078125e-05
maxmed=99.99832510948181
miniqr=4.172325134277344e-05
maxiqr=99.99967217445374

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_test/dark-stat-$cam.fits

cam="B7"
minmed=0.005519390106201172
maxmed=99.98310804367065
miniqr=7.748603820800781e-05
maxiqr=99.96340274810791

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_test/dark-stat-$cam.fits --mask $DESI_SPECTRO_CALIB/ccd/pixmask-sm8-b.fits

cam="B8"
minmed=4.172325134277344e-05
maxmed=99.99744296073914
miniqr=1.1920928955078125e-05
maxiqr=99.99843835830688

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_test/dark-stat-$cam.fits

cam="B9"
minmed=0.00010728836059570312
maxmed=99.99662637710571
miniqr=2.384185791015625e-05
maxiqr=99.99820590019226

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_test/dark-stat-$cam.fits

cam="R0"
minmed=8.832573967507433e-05
maxmed=99.99991756264296
miniqr=0.0
maxiqr=99.99991756264296

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_test/dark-stat-$cam.fits