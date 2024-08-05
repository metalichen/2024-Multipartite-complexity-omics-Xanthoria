#!/usr/bin/bash
set -e

source package /tgac/software/testing/bin/iqtree-2.2.2.2

alignment=$1
cores=$2

iqtree2 -s $alignment -B 10000 -T $cores --threads-max $cores