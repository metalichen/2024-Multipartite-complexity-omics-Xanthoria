#!/usr/bin/bash
set -e

source package 29a74b59-88fc-4453-a30b-1310b34910b9
source package aeee87c4-1923-4732-aca2-f2aff23580cc

index=$1
fq1=$2
fq2=$3
name=$4
cores=$5 
samtoolscores=$(($cores-1))

bowtie2 -q -x $index -1 $fq1 -2 $fq2 -p $cores > "$name".sam
samtools sort "$name".sam -o "$name".bam -@ $samtoolscores
rm "$name".sam
samtools index "$name".bam  -@ $samtoolscores