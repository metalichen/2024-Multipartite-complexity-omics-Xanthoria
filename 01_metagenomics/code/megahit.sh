#!/usr/bin/bash
set -e

fq1=$1
fq2=$2
output=$3




source package /tsl/software/testing/bin/megahit-1.2.6 
megahit -1 $fq1 -2 $fq2 -o $output -t 20 --min-contig-len 1000 --mem-flag 1 -m 80e9 -f