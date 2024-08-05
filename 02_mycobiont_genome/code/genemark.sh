#!/usr/bin/bash
set -e

assemblymasked=$1
filename=$(basename $assemblymasked)
outdir=$2
thread=$3

#genemark
source genemark_ES_ET_EP-4.62_CBG 
mkdir -p "$outdir"/genemark
cd "$outdir"/genemark
gmes_petap.pl --ES --max_intron 3000 --soft_mask 2000 --cores $thread  --fungus --sequence ../../$filename
