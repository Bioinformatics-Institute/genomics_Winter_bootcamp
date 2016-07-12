#!/bin/bash

## Script to preprocess files before genome assembly

## Analyse all fastq files using SolexaQA++ analysis, and put results in a separate directory called "analysis"

# Makes the output directory
mkdir -p $DNAWORKING/analysis;

# Runs SolexaQA++ analysis and puts outputs in the analysis directory
SolexaQA++ analysis $DNARAW/*.fastq.gz -d $DNAWORKING/analysis;

# Opens a file window to look at the files
nautilus $DNAWORKING/analysis
