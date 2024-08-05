#!/usr/bin/bash
set -e

assembly=$1
output=$2
prefix=$3


singularity run ../singularity/funannotate.sif funannotate clean -i $assembly -o $assembly.clean

singularity run ../singularity/funannotate.sif funannotate sort -i $assembly.clean -o $output -b $prefix

rm $assembly.clean

