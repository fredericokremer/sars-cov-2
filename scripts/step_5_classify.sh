#!/usr/bin/env bash

mkdir -p data/classification/
pangolin --update-data
pangolin -o data/classification/ data/variants/genome.fasta
