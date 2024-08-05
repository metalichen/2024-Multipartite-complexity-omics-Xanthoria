#!/usr/bin/bash
set -e

assembly=$1
outdir=`dirname $2`
prefix=$3
bin=$4
thread=$5

singularity run ../singularity/prokka.sif prokka --compliant --centre TSL --outdir $outdir --locustag $prefix --prefix $bin --cpus $thread $assembly --force