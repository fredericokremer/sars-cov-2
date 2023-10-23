#!/usr/bin/env bash

mkdir -p data/raw_qc
fastqc --nano -o data/raw_qc/ data/raw/reads.fastq