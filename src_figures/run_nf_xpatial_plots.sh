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

echo "Making UMAP figs"

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
    --outfile "${output_dir}/UMAP_BANKSY_L0_annotated.pdf"

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
    --outfile "${output_dir}/UMAP_BANKSY_L0.pdf"

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
    --outfile "${output_dir}/UMAP_BANKSYSeurat_L0.pdf"

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
    --outfile "${output_dir}/UMAP_Seurat.pdf"

####################
### STANDARD QCS ###
####################

echo "Making standards QCs figs"

input_obj="${working_dir}/data/compiled_compiled.rds"

## FEATURE AND COUNT VIOLINS ##
# note we use just one of the samples as representative for the paper (source code change)
${nf_xpatial_fun}/qc_vln_plot.R \
    --features "nCount_Xenium,nFeature_Xenium" --ncols_vln 2 \
    --input $input_obj \
    --outfile "${output_dir}/violins_qc_plot.pdf" \
    --width 6 \
    --height 5

## FEATURE AND COUNT SCATTER ##
${nf_xpatial_fun}/qc_feature_scatter_plot.R \
    --feature1 "nCount_Xenium" --feature2 "nFeature_Xenium" \
    --input $input_obj \
    --outfile "${output_dir}/scatter_qc_plot.pdf" \
    --width 6 \
    --height 5


##############################
### CELL SEG AND SHAPE QCS ###
##############################

echo "Making cell seg and shape figs"

# input data is pre-filtering compiled obj from nf_xpatial run (same for both seg & shape)
input_obj="${working_dir}/data/compiled_compiled.rds"
x_meta="Sample"

## SEG ##
fill_meta="segmentation_method"

${nf_xpatial_fun}/qc_proportion_plot.R \
    --input $input_obj \
    --outfile "${output_dir}/segmentation_proportion_plot.pdf" \
    --fill_col $fill_meta \
    --x_col $x_meta \
    --width 5 \
    --height 5

## SHAPE ##

fill_meta="shape_classification"

${nf_xpatial_fun}/qc_proportion_plot.R \
    --input $input_obj \
    --outfile "${output_dir}/shape_proportion_plot.pdf" \
    --fill_col $fill_meta \
    --x_col $x_meta \
    --width 5 \
    --height 5

################
### AREA QCS ###
################
echo "Making area qc figs"

input_obj="${working_dir}/data/compiled_area.csv"

${nf_xpatial_fun}/qc_box_plot.R \
    --input $input_obj \
    --outfile ${output_dir}/area_box_plot.pdf \
    --width 6 \
    --height 5

${nf_xpatial_fun}/qc_overlapping_histogram_plot.R \
    --input $input_obj \
    --outfile "${output_dir}/area_overlapping_histogram_plot.pdf" \
    --width 6 \
    --height 5

###########################
### SPLIT CLUSTER PLOTS ###
###########################
echo "Making split cluster figs"

input_obj="${working_dir}/results/1_MapMyCells/compiled_area_norm_all_clusters_MMC.rds"
embeddings_flag="BANKSY_umap_l0.0.k15.d30"
cluster_flag="clust_BSKY_l0.0_k15_d30_r1.2"

${nf_xpatial_fun}/qc_split_cluster_plots.R \
    --width 12 --height 8 \
    --reduction $embeddings_flag \
    --cluster_col $cluster_flag \
    --assay "AreaNorm" \
    --input $input_obj \
    --outfile "${output_dir}/BANKSY_l0.0.k15.d30_split_cluster.png"
    

embeddings_flag="BANKSY_umap_l0.9.k30.d30"
cluster_flag="clust_BSKY_l0.9_k30_d30_r0.8"

${nf_xpatial_fun}/qc_split_cluster_plots.R \
    --width 12 --height 8 \
    --reduction $embeddings_flag \
    --cluster_col $cluster_flag \
    --assay "AreaNorm" \
    --input $input_obj \
    --outfile "${output_dir}/BANKSY_l0.9.k30.d30_split_cluster.png"

################
### CLEAN-UP ###
################
echo "cleaning working dir"

rm -rf ./R_sessionInfo.log