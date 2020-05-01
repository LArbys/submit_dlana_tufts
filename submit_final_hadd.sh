#!/bin/bash

# slurm submission script for making larmatch training data

#SBATCH --job-name=dlana_finalhadd
#SBATCH --output=dlana_final_hadd.log
#SBATCH --mem-per-cpu=2000
#SBATCH --time=2:00:00

container=/cluster/tufts/wongjiradlab/larbys/larbys-containers/singularity_dldependencies_pytorch1.3.sing
RUN_DLANA_DIR=/cluster/tufts/wongjiradlab/larbys/run_dlana_jobs

#SAMPLE_NAME=mcc9_v29e_dl_run3b_bnb_nu_overlay_nocrtremerge # 15519 files
#SAMPLE_NAME=mcc9_v40a_dl_run3b_bnb_intrinsic_nue_overlay_CV # 1296 files
#SAMPLE_NAME=mcc9_v40a_dl_run3b_bnb_intrinsic_nue_overlay_wiremodX # 1413 files
#SAMPLE_NAME=mcc9_v40a_dl_run3b_bnb_overlay_wiremodX                # 1658 files
#SAMPLE_NAME=mcc9_v29e_dl_run3_G1_extbnb                            # 34254 files
SAMPLE_NAME=mcc9_v28_wctagger_run3_bnb1e19                         # 2504 files

HADDOUT_DIR=${RUN_DLANA_DIR}/haddout/subfolders/${SAMPLE_NAME}
FINAL_HADDOUT=${RUN_DLANA_DIR}/haddout/${SAMPLE_NAME}.root

module load singularity
srun singularity exec ${container} bash -c "cd ${RUN_DLANA_DIR} && source do_final_hadd.sh ${SAMPLE_NAME} ${HADDOUT_DIR} ${FINAL_HADDOUT}"

