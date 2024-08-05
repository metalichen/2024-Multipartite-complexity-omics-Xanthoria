#!/usr/bin/bash
#set -e

fasta=$1

source package /tgac/software/testing/bin/mafft-7.271
source package /tsl/software/testing/bin/trimal-latest     
source package /tgac/software/testing/bin/gcc-4.9.1 


mafft --maxiterate 1000 --thread $cores --genafpair $fasta > "$fasta"_aligned.fa
trimal -in "$fasta"_aligned.fa -out "$fasta"_aligned.phyl -gt 0.3 -phylip  -keepheader

