#!/usr/bin/env bash

mkdir -p data/variants/
minimap2 -a -x map-ont -t 1 data/genome/reference.fasta data/filtered/reads.fastq > data/variants/alignment.sam
samtools view -u -h -q 20 -F 1 data/variants/alignment.sam | samtools sort - > data/variants/alignment.bam
samtools index data/variants/alignment.bam
bcftools mpileup --fasta-ref data/genome/reference.fasta --max-depth 200 data/variants/alignment.bam | bcftools call --variants-only --multiallelic-caller --output-type z --output data/variants/variants.raw.vcf.gz
bcftools view --exclude "QUAL<150" --output-type z < data/variants/variants.raw.vcf.gz > data/variants/variants.vcf.gz
bcftools index data/variants/variants.vcf.gz
bcftools consensus --prefix "new_isolate|reference=" --fasta-ref data/genome/reference.fasta --mark-del '-' data/variants/variants.vcf.gz > data/variants/genome.fasta