#HACK TO USE CUSTOM PACKAGE
module purge
source /global/common/software/desi/desi_environment.sh master
module unload desispec
export PYTHONPATH=$HOME/desispec/py/:$PYTHONPATH
export PATH=$HOME/desispec/bin:$PATH
export DESI_SPECTRO_CALIB=/global/cfs/cdirs/desi/spectro/desi_spectro_calib/trunk
#read in the names for dark

mapfile -t darkFiles < dark_paths_20200209.txt

# cam="B0"
# minmed=0.000000
# maxmed=99.984980
# miniqr=0.000000
# maxiqr=99.988103

# desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_test/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_test/dark-stat-$cam.fits


# cam="Z0"
# minmed=0.003668
# maxmed=99.995990
# miniqr=0.000000
# maxiqr=99.987369

# desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_test/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_test/dark-stat-$cam.fits --mask $DESI_SPECTRO_CALIB/ccd/pixmask-sm4-z.fits


cam="R5"
minmed=2e-2
maxmed=99.960901
miniqr=0.000000
maxiqr=99.957981

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_test/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_test/dark-stat-$cam.fits --mask $DESI_SPECTRO_CALIB/ccd/pixmask-sm9-r.fits