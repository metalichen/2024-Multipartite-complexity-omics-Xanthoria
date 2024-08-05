#!/usr/bin/bash
set -e

fasta=$1
out=$2
mode=$3


source package ca890cd7-f81d-4c22-9f4a-5b40ab671c79
source package 85f2de80-4bd0-48dc-9303-bba1a19206e4
export AUGUSTUS_CONFIG_PATH=analysis_and_temp_files/02_binning/tmp_augustus/config
mkdir -p analysis_and_temp_files/03_id_alga/busco 
busco -i $fasta -o $out --out_path analysis_and_temp_files/03_id_alga/busco  -m  $mode -l  /tsl/data/busco_lineages/chlorophyta_odb10 --offline -f -c 5


