#!/usr/bin/bash

source kallisto-0.46.2
set -e

idx=$1
threads=$2
boots=$3
fq1=$4
fq2=$5
out=$6
out=`dirname $6`

kallisto quant -i $idx -t $threads -b $boots -o $out --pseudobam $fq1 $fq2
