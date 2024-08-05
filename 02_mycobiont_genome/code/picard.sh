#!/usr/bin/bash
set -e


input=$1
output=$2
stats=$3

source package ce4daee0-abd9-4cc6-8b13-5fe8ede3b149

picard MarkDuplicates I=$input O=$output M=$stats ASSUME_SORT_ORDER=coordinate CREATE_INDEX=true TMP_DIR="temp"
