#!/usr/bin/bash
set -e

mags=$1
out=$2
bam=$3
linktable=$4
cores=$5

outdir=`dirname $2`

#prep bam file: need to remove unmapped reads
source package aeee87c4-1923-4732-aca2-f2aff23580cc
samtools view -q 20  -b $bam > "$bam".filtered 
samtools index "$bam".filtered
 


#link bins
singularity exec ../singularity/eukcc.sif binlinks.py  --ANI 99 --within 1500 \
    --out $linktable $mags "$bam".filtered


#analyze linked bins and detect MAGs
singularity exec ../singularity/eukcc.sif eukcc folder \
    --out $outdir  --db /tsl/data/externalData/ntalbot/lichen_project/eukccdb/eukcc2_db_ver_1.2 \
    --threads $cores  \
    --links $linktable \
    $mags

#sort out files    
rm "$bam".filtered