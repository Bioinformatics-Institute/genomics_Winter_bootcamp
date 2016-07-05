#!/bin/bash

## Script to preprocess files before genome assembly

## Analyse all fastq files using SolexaQA++ analysis, and put results in a separate directory called "analysis"

# Makes the output directory
mkdir -p trimmed;

# Runs SolexaQA++ analysis and puts outputs in the analysis directory
SolexaQA++ dynamictrim raw/*.fastq.gz -d trimmed;

mkdir -p lengthsorted;

for var in PE310 MP2000 MP5000; do

SolexaQA++ lengthsort trimmed/${var}_L.fastq.trimmed.gz trimmed/${var}_R.fastq.trimmed.gz -d lengthsorted;

done



