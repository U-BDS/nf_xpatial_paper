
module load Anaconda3
module load Singularity

conda activate nextflow

#export NXF_JVM_ARGS="-Xms50g -Xmx95g"

PARAMS_FILE=/scratch/atrull/Projects/Ianov_Lara_001_2026/workspace/params.yml

nextflow run U-BDS/nf_xpatial -r 1.0.0 -resume \
    -c cheaha_mod.conf \
    --outdir ./nf_xpatial_paper \
    -params-file $PARAMS_FILE
