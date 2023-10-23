#!/usr/bin/env bash

mkdir -p data/raw/
fastq-dump --stdout SRR24146463 > data/raw/reads.fastq