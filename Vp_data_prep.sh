#!/bin/bash

## This script uses the raw data that was used to generate the Vp genome, maps to a subset of the genome (a large 600kb contig) and obtains reads that were properly paired and the primary mapping as left and right read FASTQ files.


# Map Paired-end 310bp insert library
bowtie2  -x Vp_subgenome -p 8 --no-unal --fr -1 ~/Dropbox/PhD/raw_vp_sequence/s_1_1_sequence.fastq.gz -2 ~/Dropbox/PhD/raw_vp_sequence/s_1_2_sequence.fastq.gz  > PE310.sam;

#Convert sam to bam
samtools view -b PE310.sam > PE310.bam;
rm PE310.sam;

# Map mate-paired 2000bp insert library (actually closer to 2300bp as graphics from PhD show); reads have been reverse-complemented
bowtie2  -x Vp_subgenome -p 8 --no-unal --fr -I 1700 -X 2700 -1 MP2000_L.fastq -2 MP2000_R.fastq  > MP2000.sam;

#Convert sam to bam
samtools view -b MP2000.sam > MP2000.bam;
rm MP2000.sam;

# Map mate-paired 5000bp insert library (actually closer to 3400bp as graphics from PhD show); reads have been reverse-complemented
bowtie2  -x Vp_subgenome -p 8 --no-unal --fr -I 3000 -X 3800 -1 MP5000_L.fastq -2 MP5000_R.fastq  > MP5000.sam;

#Convert sam to bam
#samtools view -b MP5000.sam > MP5000.bam;
#rm MP5000.sam;

for var in PE310 MP2000 MP5000; do

bamtools filter -in ${var}.bam -isPrimaryAlignment true -isMapped true -isFirstMate true -isProperPair true | bamtools convert -in - -format fastq > ${var}_L.fastq;

bamtools filter -in ${var}.bam -isPrimaryAlignment true -isMapped true -isSecondMate true -isProperPair true| bamtools convert -in - -format fastq > ${var}_R.fastq;
done
