#!/usr/bin/bash
set -e

alignment=$1

source package /tgac/software/testing/bin/raxml-8.2.12

raxmlHPC-PTHREADS -T 20 -f a -m PROTGAMMAAUTO -p 12345 -x 12345 -# 1000 -s $alignment -n raxml_tree