#!/bin/bash

## Script to map original reads back onto the newly assembled genome, for viewing in a browser and as a sanity check

cd $DNAWORKING
# Make a bowtie2 index for the newly assembled genome
mkdir -p $DNAWORKING/index;

bowtie2-build $DNAWORKING/assembly/contigs.fa $DNAWORKING/index/Vp;

# Map just the paired-end reads separated by ~310bp
# Note that we don't change the defaults of the expected minimum and maximum insert size
mkdir -p $DNAWORKING/mapping;

bowtie2 -x $DNAWORKING/index/Vp -1 $DNARAW/PE310_L.fastq.gz -2 $DNARAW/PE310_R.fastq.gz --minins 0 --maxins 500 -S $DNAWORKING/mapping/PE310.sam;

# Map just the paired-end reads separated by ~2000bp
# Note that we change the defaults of the expected minimum and maximum insert size
bowtie2 -x $DNAWORKING/index/Vp -1 $DNARAW/MP2000_L.fastq.gz -2 $DNARAW/MP2000_R.fastq.gz --minins 1700 --maxins 2700 -S $DNAWORKING/mapping/MP2000.sam;

# Map just the paired-end reads separated by ~5000bp
bowtie2 -x $DNAWORKING/index/Vp -1 $DNARAW/MP5000_L.fastq.gz -2 $DNARAW/MP5000_R.fastq.gz --minins 3000 --maxins 3800 -S $DNAWORKING/mapping/MP5000.sam;

# Merge all the mappings together.. option commented out for now.

#samtools merge merged.sam PE310.sam MP2000.sam MP5000.sam

# Convert to BAM and sort
for var in PE310 MP2000 MP5000;
	do

	samtools view -bS $DNAWORKING/mapping/${var}.sam |samtools sort - $DNAWORKING/mapping/${var};
	samtools index $DNAWORKING/mapping/${var}.bam
	rm $DNAWORKING/mapping/${var}.sam
done;

igv -g $DNAWORKING/assembly/contigs.fa $DNAWORKING/mapping/PE310.bam,$DNAWORKING/mapping/MP2000.bam,$DNAWORKING/mapping/MP5000.bam,$DNAWORKING/annotation/Vp_augustus.gff3



