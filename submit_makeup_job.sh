#!/bin/bash

# slurm submission script for making larmatch training data

#SBATCH --job-name=dlana_makeup
#SBATCH --output=dlana_makeup.log
#SBATCH --mem-per-cpu=2000
#SBATCH --time=1:00:00
#SBATCH --array=0-5

container=/cluster/tufts/wongjiradlab/larbys/larbys-containers/singularity_dldependencies_pytorch1.3.sing
RUN_DLANA_DIR=/cluster/tufts/wongjiradlab/larbys/run_dlana_jobs

#SAMPLE_NAME=mcc9_v29e_dl_run3b_bnb_nu_overlay_nocrtremerge            # 15519 files
SAMPLE_NAME=mcc9_v29e_dl_run3b_bnb_intrinsic_nue_overlay_nocrtremerge # 2232  files

BADID_LIST=${RUN_DLANA_DIR}/processing_results/${SAMPLE_NAME}_badjobid.list
INPUT_LIST=${RUN_DLANA_DIR}/inputlists/${SAMPLE_NAME}.list
OUTPUT_DIR=${RUN_DLANA_DIR}/outputdir/${SAMPLE_NAME}
OUTPUT_LOGDIR=${RUN_DLANA_DIR}/logdir/${SAMPLE_NAME}

module load singularity
srun singularity exec ${container} bash -c "cd ${RUN_DLANA_DIR} && source run_makeup_job.sh $SAMPLE_NAME $INPUT_LIST $BADID_LIST $OUTPUT_DIR $OUTPUT_LOGDIR"

