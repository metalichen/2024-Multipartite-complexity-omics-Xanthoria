#!/usr/bin/bash
set -e

bins=$1
out_folder=$2
out_file=$3
threads=$4

source package  5a1c6a9a-f666-4eaa-9409-3e7435d86406
checkm lineage_wf $bins $out_folder -x fa --tab_table -f tmp_checkm.tab -t $threads
checkm qa "$out_folder"/lineage.ms "$out_folder" -o 2 --tab_table -f $out_file -t $threads