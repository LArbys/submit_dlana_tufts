#!/bin/bash

# we assume we are already in the container
#SAMPLE_NAME=mcc9_v29e_dl_run1_bnb_intrinsic_nue_LowE
#SAMPLE_NAME=mcc9_v40a_dl_run3b_bnb_overlay_CV
#SAMPLE_NAME=mcc9_v40a_dl_run3b_bnb_overlay_wiremodX
SAMPLE_NAME=mcc9_v40a_dl_run3b_bnb_intrinsic_nue_overlay_CV
#SAMPLE_NAME=mcc9_v40a_dl_run3b_bnb_intrinsic_nue_overlay_wiremodX
INPUTLIST=/cluster/tufts/wongjiradlab/larbys/run_dlana_jobs/inputlists/${SAMPLE_NAME}.list
UBDLANA_DIR=/cluster/tufts/wongjiradlab/twongj01/production/ubdlana/
OUTPUT_DIR=/cluster/tufts/wongjiradlab/larbys/run_dlana_jobs/outputdir/${SAMPLE_NAME}
OUTPUT_LOGDIR=/cluster/tufts/wongjiradlab/larbys/run_dlana_jobs/logdir/${SAMPLE_NAME}

mkdir -p $OUTPUT_DIR
mkdir -p $OUTPUT_LOGDIR

# GET LINE
stride=1
jobid=${SLURM_ARRAY_TASK_ID}
let startline=$(expr "${stride}*${jobid}")

# GET INPUT FILENAME
let lineno=${startline}+1
inputfile=`sed -n ${lineno}p ${INPUTLIST}`
echo "inputlist: $inputfile"

# LOCAL JOBDIR
local_jobdir=`printf /tmp/dlana_jobid%03d_${SAMPLE_NAME} $jobid`
echo "local jobdir: $local_jobdir"
rm -rf $local_jobdir
mkdir -p $local_jobdir

# local outfile
local_outfile=`printf merged_dlana_${SAMPLE_NAME}_jobid%03d.root $jobid`
echo "outfile : "$local_outfile

# local log file
local_logfile=`printf merged_dlana_${SAMPLE_NAME}_jobid%03d.log $jobid`
echo "output logfile: "$local_logfile

cd $UBDLANA_DIR
source setup_tufts_container.sh
source setup_env.sh

echo "PYTHONPATH:"
echo $PYTHONPATH

cd $local_jobdir
echo "python $UBDLANA_DIR/bin/run_ubdlana_lar.py -d $inputfile -c $UBDLANA_DIR/CalibrationMaps_MCC9.root -t Overlay --ismc -o $local_outfile >& $local_logfile"
python $UBDLANA_DIR/bin/run_ubdlana_lar.py -d $inputfile -c $UBDLANA_DIR/CalibrationMaps_MCC9.root -t Overlay --ismc -o $local_outfile >& $local_logfile

# move to output dir
cp $local_outfile $OUTPUT_DIR/
cp $local_logfile $OUTPUT_LOGDIR/

# clean-up
cd /tmp
rm -r $local_jobdir
