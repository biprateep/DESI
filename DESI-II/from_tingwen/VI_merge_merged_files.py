#!/usr/bin/env python
# coding: utf-8
import os, sys, glob
import numpy as np
import pandas as pd
import fnmatch


def string_cleaner(tt):
    #Clean strings
    #Remove unicode characters
    tt = ''.join(i for i in tt if ord(i)<128)

    #Replace commas with semicolons
    tt = tt.replace('","',';')
    tt = tt.replace(',',';')
    return tt

on_nersc = True
# Set to directory with all the VI files to merge
if on_nersc:
  merged_dir = os.environ['HOME']+'/projects/VI_files/Fuji/BGS/output/'
else:
  merged_dir = '/Users/uqtdavi1/Documents/programs/DESI/SV/VI_files/SV0/Blanc/BGS/output/'  

tiles = [''] 
#nights = ['20201215']  
combined_file = merged_dir+"desi-vi_SV_Fuji_BGS"+tiles[0]+"_all_220428.csv"
log_file = merged_dir+"desi-vi_SV_Fuji_BGS"+tiles[0]+"_all_220428.log"

# Read in list of files in merged directory
log=open(log_file,'w')
log.write('#Log file for'+combined_file+'\n')
all_files = os.listdir(merged_dir)
merged_files=[]
pattern = "desi*"+tiles[0]+"*_merged.csv"
for entry in all_files:
  if fnmatch.fnmatch(entry, pattern):
    merged_files.append(entry)
    log.write(entry+'\n')

    
    
print(merged_files)
print(combined_file)

# Read the first file in to vi to set up vi
print(merged_files[0])
vimerged = pd.read_csv(merged_dir + merged_files[0], delimiter = ",", engine='python',keep_default_na=False)
# Read in the rest of the files and append them to vi
for i in range(1,len(merged_files)):
    print(merged_files[i])
    vi2 = pd.read_csv(merged_dir + merged_files[i], delimiter = ",", engine='python',keep_default_na=False)
    
    vimerged = vimerged.append(vi2, ignore_index=True)

print(vimerged['all_VI_comments'])
# Get rid of evil characters
vimerged['all_VI_comments'] = vimerged['all_VI_comments'].apply(string_cleaner)
vimerged['merger_comment'] = vimerged['merger_comment'].apply(string_cleaner)
#vimerged['TILEID']=int(tiles[0])
#search = np.where(vimerged['N_VI']>3)
#vimerged['N_VI'][vimerged['N_VI']>3]=int(2)

#for i in np.arange(len(vimerged['TARGETID'])):
#  print(vimerged.loc[i]['all_VI_comments'])
#print(vimerged[['Redrock z', 'best_z', 'best class']])

# Print to a combined file
if on_nersc:
  vimerged[['TARGETID','Redrock_z', 'best_z', 'best_quality', 'Redrock_spectype', 'best_spectype', 'all_VI_issues', 'all_VI_comments', 'merger_comment','N_VI','Redrock_deltachi2','TILEID']].to_csv(combined_file,index=False)
else:
  vimerged[['TARGETID','Redrock_z', 'best_z', 'best_quality', 'Redrock_spectype', 'best_spectype', 'all_VI_issues', 'all_VI_comments', 'merger_comment','N_VI']].to_csv(combined_file,index=False)

vitest = pd.read_csv(combined_file,keep_default_na=False)
print(vitest)
log.write('# Number of objects %0.0f' % len(vitest))
log.close()