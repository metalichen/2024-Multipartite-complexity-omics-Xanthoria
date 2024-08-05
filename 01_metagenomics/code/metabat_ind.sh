#!/usr/bin/bash
set -e

assembly=$1
cores=$2
bam=$3

dir=`dirname $1`
assembly_name=$(basename ${assembly})
bam_name=$(basename ${bam})

source package 0a2dffce-c151-4379-abe9-866414c91cd7
cd $dir
runMetaBat.sh  -t $cores $assembly_name $bam_name  
mv final.contigs.fa.metabat* final.contigs.fa.metabat
touch binning_done.tmp

source package  5a1c6a9a-f666-4eaa-9409-3e7435d86406
checkm coverage final.contigs.fa.metabat final.contigs.fa.cov $bam_name -x fa

cd ../../../