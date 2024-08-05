#!/usr/bin/bash

output=$1

source package /tsl/software/testing/bin/fastqc-0.11.5 
mkdir analysis_and_temp_files/03_qc/fastqc_out -p
fastqc /tsl/data/reads/ntalbot/lichen_*/*/*/raw/*.fq.gz -o analysis_and_temp_files/03_qc/fastqc_out 

touch $output
