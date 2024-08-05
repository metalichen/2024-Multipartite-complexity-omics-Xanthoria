#!/bin/bash

set -e

mkdir -p analysis_and_temp_files/03_assembly
source package /tsl/software/testing/bin/megahit-1.2.6


megahit -1 data/fastq/GTX0465_trimmed.1.fq.gz,data/fastq/GTX0481_trimmed.1.fq.gz,data/fastq/GTX0466_trimmed.1.fq.gz,data/fastq/GTX0484_trimmed.1.fq.gz,data/fastq/GTX0493_trimmed.1.fq.gz,data/fastq/GTX0468_trimmed.1.fq.gz,data/fastq/GTX0486_487_trimmed.1.fq.gz,data/fastq/GTX0494_trimmed.1.fq.gz -2 data/fastq/GTX0465_trimmed.2.fq.gz,data/fastq/GTX0481_trimmed.2.fq.gz,data/fastq/GTX0466_trimmed.2.fq.gz,data/fastq/GTX0484_trimmed.2.fq.gz,data/fastq/GTX0493_trimmed.2.fq.gz,data/fastq/GTX0468_trimmed.2.fq.gz,data/fastq/GTX0486_487_trimmed.2.fq.gz,data/fastq/GTX0494_trimmed.2.fq.gz --min-contig-len 1000 -t 25 -m 125e9 --mem-flag 1 -o analysis_and_temp_files/03_assembly/coassembly 

source package 29a74b59-88fc-4453-a30b-1310b34910b9
bowtie2-build analysis_and_temp_files/03_assembly/coassembly/final.contigs.fa  analysis_and_temp_files/03_assembly/coassembly/coassembly_index
touch analysis_and_temp_files/03_assembly/coassembly_done.tmp
