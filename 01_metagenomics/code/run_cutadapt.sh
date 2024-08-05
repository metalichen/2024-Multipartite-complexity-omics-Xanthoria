#!/usr/bin/bash


set -e


outputo1=$1
outputo2=$2
inputfq1=$3
inputfq2=$4
threads=$5


source package /tgac/software/testing/bin/cutadapt-1.17
cutadapt -j $threads --adapter=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -A=GATCGGAAGAGCACACGTCTGAACTCCAGTCACGGATGACTATCTCGTATGCCGTCTTCTGCTTG --minimum-length=25  -o $outputo1 -p $outputo2 $inputfq1 $inputfq2


