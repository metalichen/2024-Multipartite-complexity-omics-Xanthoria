#!/usr/bin/bash
set -e

mags=$1
out=$2
mode=$3
cores=$4

outdir=`dirname $2`

mkdir -p ./tmp_gtdb
source package 45db4679-d5ad-48f7-9498-4954fc88ab1d
GTDBTK_DATA_PATH="/qib/platforms/Informatics/databases/GTDB/release202/" gtdbtk classify_wf  $mode $mags -x fa --cpus $cores --out_dir $outdir --scratch_dir ./tmp_gtdb --pplacer_cpus 1
rm -rf ./tmp_gtdb

touch $out
