#!/usr/bin/bash

fqtrimmed1=$1
fqtrimmed2=$2
sample=$3
out=$4
threads=$5

set -e

source package /tgac/software/testing/bin/sortmerna-3.0.3 
source package /tsl/software/testing/bin/bbmap-37.90  

reformat.sh in1="$fqtrimmed1" in2="$fqtrimmed2" out=analysis_and_temp_files/03_qc/trimmed_reads/"$sample"_trimmed.1.bbmapmerged.fq.gz overwrite=true


sortmerna --ref data/silva132_90.fna,data/silva132_90.idx --reads-gz analysis_and_temp_files/03_qc/trimmed_reads/"$sample"_trimmed.1.bbmapmerged.fq.gz --fastx --paired_in        --aligned analysis_and_temp_files/03_qc/trimmed_reads/"$sample"_trimmed.bbmapmerged.rRNA --other analysis_and_temp_files/03_qc/trimmed_reads/"$sample"_trimmed.bbmapmerged.non_rRNA -v -d analysis_and_temp_files/03_qc/sortmerna_tmp/$sample -a threads

reformat.sh in=analysis_and_temp_files/03_qc/trimmed_reads/"$sample"_trimmed.bbmapmerged.non_rRNA.fastq out1=analysis_and_temp_files/03_qc/trimmed_reads/"$sample"_trimmed.bbmapmerged.non_rRNA.1.fq out2=analysis_and_temp_files/03_qc/trimmed_reads/"$sample"_trimmed.bbmapmerged.non_rRNA.2.fq overwrite=true

gzip analysis_and_temp_files/03_qc/trimmed_reads/"$sample"_trimmed.bbmapmerged.non_rRNA.*.fq
gzip analysis_and_temp_files/03_qc/trimmed_reads/"$sample"_trimmed.bbmapmerged.rRNA.fastq
rm analysis_and_temp_files/03_qc/trimmed_reads/"$sample"_trimmed.1.bbmapmerged.fq.gz
rm analysis_and_temp_files/03_qc/trimmed_reads/"$sample"_trimmed.bbmapmerged.non_rRNA.fastq