#!/bin/bash

SAMPLE_NAME=$1
INPUTLIST=$2
BADJOBID_LIST=$3
OUTPUT_DIR=$4
OUTPUT_LOGDIR=$5

UBDLANA_DIR=/cluster/tufts/wongjiradlab/twongj01/production/ubdlana/

# GET JOBID
jobidline=$((${SLURM_ARRAY_TASK_ID}+1))
jobid=$(sed -n ${jobidline}p ${BADJOBID_LIST})
echo "bad jobid: "$jobid

# GET INPUT FILENAME
lineno=$((${jobid}+1))
inputfile=$(sed -n ${lineno}p ${INPUTLIST})
echo "inputlist: $inputfile"

# LOCAL JOBDIR
local_jobdir=`printf /tmp/dlana_makeup_jobid%03d_${SAMPLE_NAME} $jobid`
echo "local jobdir: $local_jobdir"
rm -rf $local_jobdir
mkdir -p $local_jobdir

# local outfile
local_outfile=`printf merged_dlana_${SAMPLE_NAME}_jobid%03d.root $jobid`
echo "local outfile : "$local_outfile

# local log file
local_logfile=`printf makeup_merged_dlana_${SAMPLE_NAME}_jobid%03d.log $jobid`
echo "output logfile: "$local_logfile

cd $UBDLANA_DIR
source setup_tufts_container.sh
source setup_env.sh

cd $local_jobdir
echo "python $UBDLANA_DIR/bin/run_ubdlana_lar.py -d $inputfile -c $UBDLANA_DIR/CalibrationMaps_MCC9.root -t Overlay --ismc -o $local_outfile >& $local_logfile"
python $UBDLANA_DIR/bin/run_ubdlana_lar.py -d $inputfile -c $UBDLANA_DIR/CalibrationMaps_MCC9.root -t Overlay --ismc -oh ophitBeamCalib -o $local_outfile >& $local_logfile
#python $UBDLANA_DIR/bin/run_ubdlana_lar.py -d $inputfile -c $UBDLANA_DIR/CalibrationMaps_MCC9.root -t Overlay --ismc -oh ophitBeam -o $local_outfile >& $local_logfile

# define subdir
let nsubdir=${jobid}/100
subdir=`printf %03d ${nsubdir}`

# move to output dir
echo "COPY output to "${OUTPUT_DIR}/${subdir}/
mkdir -p $OUTPUT_DIR/${subdir}/
cp $local_outfile $OUTPUT_DIR/${subdir}
cp $local_logfile $OUTPUT_LOGDIR/

# clean-up
cd /tmp
rm -r $local_jobdir


