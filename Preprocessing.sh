#!/bin/bash

## Script to preprocess files before genome assembly

## Analyse all fastq files using SolexaQA++ analysis, and put results in a separate directory called "analysis"
# Change to working directory
cd $DNAWORKING
# Makes the output directory
mkdir -p $DNAWORKING/trimmed;

# Runs SolexaQA++ analysis and puts outputs in the analysis directory
SolexaQA++ dynamictrim $DNARAW/*.fastq.gz -d $DNAWORKING/trimmed;

mkdir -p $DNAWORKING/lengthsorted;

for var in PE310 MP2000 MP5000; do

SolexaQA++ lengthsort $DNAWORKING/trimmed/${var}_L.fastq.trimmed.gz $DNAWORKING/trimmed/${var}_R.fastq.trimmed.gz -d $DNAWORKING/lengthsorted;

done



