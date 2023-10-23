#!/usr/bin/env bash

mkdir -p data/filtered/

NanoFilt --headcrop 10 data/raw/reads.fastq > data/filtered/reads.fastq