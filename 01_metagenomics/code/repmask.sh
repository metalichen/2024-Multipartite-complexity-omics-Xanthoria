#!/usr/bin/bash
set -e

assembly=$1
lineage=$2

#define params that differ for fungi and alga
if [[ $lineage = "fungus" ]]
then
   repbase="fngrep.ref"
else
   repbase="chlrep.ref"
fi

#set paths and load software
source package /tsl/software/testing/bin/repeatmasker-4.0.9 

RepeatMasker -pa 2 -a -s -gff -xsmall -lib /tsl/software/testing/repeatmasker/RepeatMasker/4.0.3/x86_64/bin/Libraries/RepBase18.08.fasta/$repbase $assembly &> $assembly.repeatmasker.out 

