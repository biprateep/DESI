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

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="B1"
minmed=0.00014901161193847656
maxmed=99.99498724937439
miniqr=5.364418029785156e-05
maxiqr=99.99542832374573

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="B2"
minmed=5.9604644775390625e-05
maxmed=99.99713897705078
miniqr=2.9802322387695312e-05
maxiqr=99.99812841415405

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="B3"
minmed=5.9604644775390625e-06
maxmed=99.99526143074036
miniqr=1.7881393432617188e-05
maxiqr=99.99605417251587

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="B4"
minmed=0.00057220458984375
maxmed=99.99844431877136
miniqr=1.1920928955078125e-05
maxiqr=99.99983310699463

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="B5"
minmed=3.5762786865234375e-05
maxmed=99.99638199806213
miniqr=1.1920928955078125e-05
maxiqr=99.99775886535645

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="B6"
minmed=1.1920928955078125e-05
maxmed=99.99832510948181
miniqr=4.172325134277344e-05
maxiqr=99.99967217445374

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="B7"
minmed=0.005519390106201172
maxmed=99.98310804367065
miniqr=7.748603820800781e-05
maxiqr=99.96340274810791

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits --mask $DESI_SPECTRO_CALIB/ccd/pixmask-sm8-b.fits

cam="B8"
minmed=4.172325134277344e-05
maxmed=99.99744296073914
miniqr=1.1920928955078125e-05
maxiqr=99.99843835830688

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="B9"
minmed=0.00010728836059570312
maxmed=99.99662637710571
miniqr=2.384185791015625e-05
maxiqr=99.99820590019226

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="R0"
minmed=8.832573967507433e-05
maxmed=99.99991756264296
miniqr=0.0
maxiqr=99.99991756264296

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="R1"
minmed=0.0023023576141969378
maxmed=99.99619610481133
miniqr=0.0
maxiqr=99.99190936224576

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="R2"
minmed=0.01195341676936006
maxmed=99.97745927123492
miniqr=0.0
maxiqr=99.97783023934156

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits --mask $DESI_SPECTRO_CALIB/ccd/pixmask-r4-M1-48-20190327.fits

cam="R3"
minmed=0.0
maxmed=99.99978212984213
miniqr=0.0
maxiqr=99.99989989749504

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="R4"
minmed=5.888382645004956e-06
maxmed=99.99997644646942
miniqr=0.0
maxiqr=99.99996466970413

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="R5"
minmed=0.02086842809389756
maxmed=99.96090113923717
miniqr=0.0
maxiqr=99.95798050144525

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits --mask $DESI_SPECTRO_CALIB/ccd/pixmask-sm9-r.fits

cam="R6"
minmed=2.3553530580019823e-05
maxmed=99.99959958998014
miniqr=0.0
maxiqr=99.99975857631155

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="R7"
minmed=0.0009480296058457979
maxmed=99.99787429386515
miniqr=0.0
maxiqr=99.98436045569487

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="R8"
minmed=0.0
maxmed=99.99991756264296
miniqr=0.0
maxiqr=99.99998822323471

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="R9"
minmed=0.0
maxmed=99.99995289293884
miniqr=0.0
maxiqr=99.99995878132148

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="Z0"
minmed=0.0036684623878380875
maxmed=99.99599001141875
miniqr=0.0
maxiqr=99.98736941922647

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits --mask $DESI_SPECTRO_CALIB/ccd/pixmask-sm4-z.fits

cam="Z1"
minmed=0.000659498856240555
maxmed=99.98944801830015
miniqr=0.0
maxiqr=99.98895339415797

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="Z2"
minmed=0.0023612414406469872
maxmed=99.99577802964353
miniqr=0.0
maxiqr=99.97998538738963

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits --mask $DESI_SPECTRO_CALIB/ccd/pixmask-sm5-z.fits

cam="Z3"
minmed=5.888382645004956e-06
maxmed=99.99967025057188
miniqr=0.0
maxiqr=99.99984690205123

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="Z4"
minmed=0.0
maxmed=99.99991167426033
miniqr=0.0
maxiqr=99.99998822323471

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="Z5"
minmed=0.037220466699076325
maxmed=99.98291780194684
miniqr=0.0
maxiqr=99.9681674034211

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits --mask $DESI_SPECTRO_CALIB/ccd/pixmask-sm9-z.fits

cam="Z6"
minmed=0.011341024974279544
maxmed=99.99783307518663
miniqr=0.0
maxiqr=99.98742830305291

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="Z7"
minmed=0.00012365603554510406
maxmed=99.99861623007843
miniqr=0.0
maxiqr=99.99911674260325

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits --mask /global/cscratch1/sd/bid13/desi_masks_dark/prelim-mask-Z7.fits

cam="Z8"
minmed=0.0
maxmed=99.99987045558181
miniqr=0.0
maxiqr=99.99991756264296

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits

cam="Z9"
minmed=0.0
maxmed=99.99996466970413
miniqr=0.0
maxiqr=99.99997644646942

desi_compute_mask_dark -i "${darkFiles[@]}" -o /global/cscratch1/sd/bid13/desi_masks_dark/pixmask-$cam.fits --camera $cam --bias /global/cscratch1/sd/bid13/desi_masks_dark/bias-$cam.fits --minmed $minmed --maxmed $maxmed --miniqr $miniqr --maxiqr $maxiqr --savestat True --outfilestat /global/cscratch1/sd/bid13/desi_masks_dark/dark-stat-$cam.fits