#!/usr/bin/bash
set -e

fq1=$1
fq2=$2
sample=$3
out1=$4
out2=$5


source package 29a74b59-88fc-4453-a30b-1310b34910b9
bowtie2 -p 10 -x /tsl/data/externalData/ntalbot/lichen_project/human_ref/GRCh38_noalt_as/GRCh38_noalt_as  \
  -1 $fq1 \
  -2 $fq2 \
  --un-conc-gz \
  "$sample"_hg_removed \
  > data/fastq/"$sample"_mapped_and_unmapped.sam
mv "$sample"_hg_removed.1 $out1
mv "$sample"_hg_removed.2 $out2
rm data/fastq/"$sample"_mapped_and_unmapped.sam
