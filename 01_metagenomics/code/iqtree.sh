#!/usr/bin/bash
set -e

source package /tgac/software/testing/bin/iqtree-2.2.2.2

alignment=$1
cores=$2
bootstraps=$3

iqtree2 -s $alignment -B $bootstraps -T AUTO --threads-max $cores -m TEST  -seed 12345