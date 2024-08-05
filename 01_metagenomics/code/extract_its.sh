#!/usr/bin/bash
set -e

query=$1
subject=$2
out=$3
name=$4

source package /tsl/software/testing/bin/blast+-2.9.0 
blastn -query $query -subject $subject -outfmt '6 qseqid sseqid sseq evalue' -evalue 1e-140 -out tmp_$name_blast.txt

# to write the data.file in fasta :
awk 'BEGIN { OFS = "\n"} {print ">" $1 $2, $3}' tmp_'$name'_blast.txt | tr -d "-" | awk -v samplename="$name"_ '/>/{{sub(">","&" samplename);sub(/\.fasta/,x)}}1' > $out
rm tmp_$name_blast.txt

