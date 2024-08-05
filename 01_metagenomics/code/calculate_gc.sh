#!/usr/bin/bash
set -e

input=$1
output=$2

source package /tsl/software/testing/bin/bbmap-37.90 
stats.sh in=$input gc=$output gcformat=4