# Village Editing Analyses

This repository contains code and outputs for **differential expression (DE)** and **latent factor (PEER)** analyses performed as part of our publication.

## Repository Contents

### `differential_expression_analysis.ipynb`
Jupyter notebook for the core differential expression analysis.  
This analysis follows the methodology described in the manuscript and includes:
- Counts normalization
- Differential expression testing (pairwise comparisons, dosage modeling)
- Gene set enrichment analysis (GSEA) using **fgsea** with MSigDB and custom gene sets
- TRADE analysis

### `run_PEER.sh`
Shell script for running **PEER** on merged neuron and astrocyte datasets.
- Requires **R v3.5** 
- Inputs: CPM-normalized, log-transformed, rank-based INT gene expression matrices
- run with **15 latent factors**

### `analyze_peer_outputs.ipynb`
Notebook for downstream analysis of **PEER latent factors**, including:
- Heatmap visualization of PEER factors stratified by genotype
- Per-genotype factor distribution testing (Wilcoxon rank-sum tests)
- GSEA on PEER weight matrices to interpret latent biological variation

---

These scripts and notebooks directly reflect the analyses described in the **Methods** section of the manuscript.
