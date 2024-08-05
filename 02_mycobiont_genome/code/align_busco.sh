#!/usr/bin/bash
set -e

fasta=$1
out=$2


source package /tgac/software/testing/bin/mafft-7.271
source package /tsl/software/testing/bin/trimal-1.2

tmpname="${fasta%.*}"

mkdir -p 

mafft --maxiterate 1000 --genafpair $fasta > '$tmpname'.aligned.faa
trimal -in '$tmpname'.aligned.faa -out $out -gt 0.3 -phylip