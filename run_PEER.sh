#!/bin/bash

#This script runs latent factor analysis
#Requires: PEER, which runs on R version 3.5

#Define root directory for input/output
exp_root=/path/to/analysis/PEER

# List of normlaized expression matrices to analyze
# Each expression matrix contains gene names and gene expression values for top 5000 most variabale genes
    #for each sample, normalized using logCPM and inverse normal transforming
exp_files=(
    neuron_and_astrocyte_expression_matrix.txt
)

#Loop through each file and run PEER
for file in "${exp_files[@]}"; do

    treat=${file%"_counts_peer.txt"*}
    out_dir=${exp_root}/${treat}
    mkdir -p "$out_dir"

    cmd="peer \
        --inExpressionFile ${exp_root}/data/${file} \
        --numFactors 15 \
        --outCovariatesFile ${out_dir}/param15.covars_out.txt \
        --outWeightsFile ${out_dir}/param15.weights_out.txt \
        --outNormalizedExpression ${out_dir}/param15.out_norm_expression.txt"

    qsub -N "${treat}.PEER" \
         -l h_rt=24:00:00,mem_free=32G \
         -o ${exp_root}/logs/ \
         -e ${exp_root}/logs/ \
         -b y "$cmd"

done