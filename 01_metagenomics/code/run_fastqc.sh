#!/usr/bin/bash
set -e

fq=$1
source package /tsl/software/testing/bin/fastqc-0.11.5
mkdir -p analysis_and_temp_files/02_data_qc/fastqc_out
fastqc $fq -o analysis_and_temp_files/02_data_qc/fastqc_out
		
