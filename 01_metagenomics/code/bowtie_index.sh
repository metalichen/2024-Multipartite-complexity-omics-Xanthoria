#!/usr/bin/bash
set -e

fasta=$1
out=$2

outdir=`dirname $2`

source package 29a74b59-88fc-4453-a30b-1310b34910b9
bowtie2-build $fasta  "$outdir"/index
touch $out


source package 29a74b59-88fc-4453-a30b-1310b34910b9
bowtie2-build analysis_and_temp_files/03_assembly/coassembly/final.contigs.fa  analysis_and_temp_files/03_assembly/coassembly/coassembly_index
touch analysis_and_temp_files/03_assembly/coassembly_done.tmp

