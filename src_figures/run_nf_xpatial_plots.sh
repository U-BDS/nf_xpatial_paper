#!/usr/bin/env bash

# re-create some nf_xpatial plots for publication (publication size)
# minor changes were made to nf_xpatial figure source code to account
# for publication needs (sizing, or longer legend names on annotated plots)

###################
### GLOBAL VARS ###
###################
working_dir=$(dirname "$PWD")
nf_xpatial_fun="${working_dir}/nf_xpatial_functions"
output_dir="${working_dir}/results/figures"

#############
### UMAPS ###
#############

## Annotated ##

input_obj="${working_dir}/results/figures/seurat_area_norm_annotated.rds"
embeddings_flag="BANKSY_umap_l0.0.k15.d30"
cluster_flag="CellType"

${nf_xpatial_fun}/qc_dim_plot_countour.R \
    --embedding $embeddings_flag \
    --cluster_col $cluster_flag \
    --input $input_obj \
    --width 6000 \
    --height 5000 \
    --element_guide_size 8 \
    --cluster_label_size 8 \
    --outfile ${output_dir}/UMAP_BANKSY_L0_annotated.pdf

## BANKSY_L0 ##

input_obj="${working_dir}/results/1_MapMyCells/compiled_area_norm_all_clusters_MMC.rds"
embeddings_flag="BANKSY_umap_l0.0.k15.d30"
cluster_flag="clust_BSKY_l0.0_k15_d30_r1.2"

${nf_xpatial_fun}/qc_dim_plot_countour.R \
    --embedding $embeddings_flag \
    --cluster_col $cluster_flag \
    --input $input_obj \
    --width 5000 \
    --height 5000 \
    --element_guide_size 8 \
    --cluster_label_size 12 \
    --outfile ${output_dir}/UMAP_BANKSY_L0.pdf

## BANKSYSeurat_L0 ##

input_obj="${working_dir}/results/1_MapMyCells/compiled_area_norm_all_clusters_MMC.rds"
embeddings_flag="BANKSYSeurat_umap_l0.0.k15.d30"
cluster_flag="clust_BSKYSEU_l0.0_k15_d30_r0.7"

${nf_xpatial_fun}/qc_dim_plot_countour.R \
    --embedding $embeddings_flag \
    --cluster_col $cluster_flag \
    --input $input_obj \
    --width 5000 \
    --height 5000 \
    --element_guide_size 8 \
    --cluster_label_size 12 \
    --outfile ${output_dir}/UMAP_BANKSYSeurat_L0.pdf

## Seurat ##

input_obj="${working_dir}/results/1_MapMyCells/compiled_area_norm_all_clusters_MMC.rds"
embeddings_flag="Seurat_umap_d30"
cluster_flag="clust_SEU_d30_r0.7"

${nf_xpatial_fun}/qc_dim_plot_countour.R \
    --embedding $embeddings_flag \
    --cluster_col $cluster_flag \
    --input $input_obj \
    --width 5000 \
    --height 5000 \
    --element_guide_size 8 \
    --cluster_label_size 12 \
    --outfile ${output_dir}/UMAP_Seurat.pdf
