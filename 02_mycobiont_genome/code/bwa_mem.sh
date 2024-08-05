#!/usr/bin/bash
set -e

genome=$1
fq1=$2
fq2=$3
sample=$4
output=$5
rg=$6

source package fa33234e-dceb-4a58-9a78-7bcf9809edd7
source package 638df626-d658-40aa-80e5-14a275b7464b


(bwa mem $genome $fq1 $fq2 -t 20 -R "$rg" -M | samtools view -Su - | samtools sort -l 5 -O bam -T "$sample"_to_longread -@ 20 > $output) 2> bam_"$sample".log