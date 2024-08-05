#!/usr/bin/bash
# this script generates index of a fasta 
set -e

fasta=$1
out_folder=$2
out_file=$3
threads=$4


source package /tgac/software/testing/bin/STAR-2.5.4b
source package /tgac/software/testing/bin/gcc-4.9.1 
STAR --runThreadN $threads \
--runMode genomeGenerate \
--genomeDir $out_folder  \
--genomeFastaFiles $fasta 

echo $timestamp > $out_file