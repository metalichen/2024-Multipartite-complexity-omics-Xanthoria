#!/usr/bin/bash
set -e

assembly=$1
cores=$2
ARRAY=( "${@:3}" ) #this takes into array all arguments passed to the command line except the two first

source package 0a2dffce-c151-4379-abe9-866414c91cd7
runMetaBat.sh  -t $cores $assembly "${ARRAY[*]}"  
mv final.contigs.fa.* analysis_and_temp_files/03_assembly/coassembly/
mv analysis_and_temp_files/03_assembly/coassembly/final.contigs.fa.metabat* analysis_and_temp_files/03_assembly/coassembly/fc.metabat
touch analysis_and_temp_files/03_assembly/coassembly/binning_done.tmp

source package  5a1c6a9a-f666-4eaa-9409-3e7435d86406
checkm coverage analysis_and_temp_files/03_assembly/coassembly/final.contigs.fa.metabat analysis_and_temp_files/03_assembly/coassembly/final.contigs.fa.cov "${ARRAY[*]}" -x fa