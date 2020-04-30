#!/bin/bash

SAMPLE_NAME=$1
OUTPUT_DIR=$2
HADDOUT_DIR=$3

# setup the container
source /usr/local/root/root-6.16.00/bin/thisroot.sh

mkdir -p $HADDOUT_DIR/$SAMPLE_NAME/

# FOR DEBUG
#SLURM_ARRAY_TASK_ID=0

jobid=${SLURM_ARRAY_TASK_ID}
lineno=$(( $jobid + 1 ))

# Get subfolder
subfolder=$(ls -d ${OUTPUT_DIR}/* | sed -n ${lineno}p)

echo "subfolder: "$subfolder

# local working folder
local_folder=`printf /tmp/dlana_subfolder_hadd_jobid%04d ${jobid}`
echo "local folder: "${local_folder}

cd /tmp/
rm -r ${local_folder}
mkdir -p $local_folder
cd ${local_folder}

# hadd files in this subdir
find ${subfolder} -name merged_dlana*root -size +20k | sort > filelist.txt

# output name
outname=`printf ${SAMPLE_NAME}_subfolderhadd_jobid%03d.root ${jobid}`
hadd -f $outname @filelist.txt

# copy files
cp $outname $HADDOUT_DIR/$SAMPLE_NAME/

# clean up
cd /tmp/
rm -r $local_folder