#!/bin/bash

# slurm submission script for making larmatch training data

#SBATCH --job-name=dlana_batch_mc
#SBATCH --output=dlana_batch_mc.log
#SBATCH --mem-per-cpu=2000
#SBATCH --time=2:00:00
#SBATCH --array=1-894

container=/cluster/tufts/wongjiradlab/larbys/larbys-containers/singularity_dldependencies_pytorch1.3.sing
RUN_DLANA_DIR=/cluster/tufts/wongjiradlab/larbys/run_dlana_jobs
OFFSET=0
STRIDE=10

SAMPLE_NAME=mcc9_v29e_dl_run3b_bnb_nu_overlay_nocrtremerge # 8940 files


module load singularity
srun singularity exec ${container} bash -c "cd ${RUN_DLANA_DIR} && source run_batch_mc.sh $OFFSET $STRIDE $SAMPLE_NAME"

