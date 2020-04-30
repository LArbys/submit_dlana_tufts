#!/bin/bash

SAMPLE_NAME=$1
SUBFOLDER_HADDOUT_DIR=$2
FINAL_HADDOUT=$3

# setup the container
source /usr/local/root/root-6.16.00/bin/thisroot.sh

# local working folder
local_folder=/tmp/dlana_finalhadd_${SAMPLE_NAME}

cd /tmp/
rm -r ${local_folder}
mkdir -p $local_folder

cd $local_folder

# hadd files in this subdir
local_out=$(basename ${FINAL_HADDOUT})
hadd -f $local_out ${SUBFOLDER_HADDOUT_DIR}/*${SAMPLE_NAME}*.root

# copy files
cp $local_out ${FINAL_HADDOUT}

# clean up
cd /tmp
rm -r $local_folder