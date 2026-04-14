#!/usr/bin/env bash
# nf-core/rnaseq 3.24.0 — differential expression prep run
#
# Samples
# -------
# condition_a (18 samples):
#   marble_finch, azure_thorn, cobalt_reed, ember_fern, flint_grove,
#   garnet_marsh, hazel_brook, indigo_peak, jasper_vale, kelp_hollow,
#   lapis_glade, mango_ridge, nexus_cove, obsid_bluff, pearl_drift,
#   quartz_fen, russet_moor, sable_knoll
#
# condition_b (18 samples):
#   teal_hollow, umber_cliff, virid_basin, willow_span, xenon_flats,
#   yucca_downs, zircon_bay, acorn_ridge, birch_delta, cedar_haven,
#   denim_falls, elder_grove, flax_summit, gorse_plain, heath_ledge,
#   ivory_shore, jetty_crest, kestrel_ford
#
# Outputs used for DESeq2:
#   results/star_salmon/salmon.merged.gene_counts.tsv
#   results/star_salmon/salmon.merged.gene_tpm.tsv

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

nextflow run nf-core/rnaseq \
    -r 3.24.0 \
    -profile docker \
    -params-file "${SCRIPT_DIR}/params.yaml" \
    --input "${SCRIPT_DIR}/samplesheet.csv" \
    --outdir "${SCRIPT_DIR}/results" \
    -resume
