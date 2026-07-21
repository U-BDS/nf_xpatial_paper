#!/bin/bash

module load Anaconda3
module load Singularity

conda activate $USER_DATA/conda_envs/nfcore_nextflow_env_2026

CHEAHA=./cheaha_mod.conf
PARAMS_FILE=./JD.params.yml

nextflow run U-BDS/nf_xpatial -r 1.0.0 \
    -profile singularity \
    --outdir ./JD.results \
    -c $CHEAHA \
    -params-file $PARAMS_FILE \
    -resume 
