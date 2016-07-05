#!/bin/bash

## Script to annotate our new genome with gene predictions
## Using the gene prediction program augustus
mkdir -p annotation;

augustus \
--strand=both \
--genemodel=complete \
--alternatives-from-sampling=true \
--noInFrameStop=true \
--stopCodonExcludedFromCDS=false \
--gff3=true \
--cds=true --codingseq=true --protein=true \
--species=chaetomium_globosum \
assembly/contigs.fa \
> annotation/Vp_augustus.gff3



