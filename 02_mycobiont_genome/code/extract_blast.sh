#!/usr/bin/bash
# this script extracts blast hits as fasta using blast output table and the original fasta file
set -e

blast=$1
fasta=$2



while read p; do
  contig="$(echo "$p" | cut -f2 )"
  sstart="$(echo "$p" | cut -f9 )"
  send="$(echo "$p" | cut -f10)"
  echo $sstart
  echo $ssend
  if [[ "$sstart" -lt "$send" ]]; then
  	samtools faidx $fasta "$contig":"$sstart"-"$send" 
  fi
  if [[ "$sstart" -ge "$send" ]]; then	
  	samtools faidx -i --mark-strand custom,,_revcompl $fasta "$contig":"$send"-"$sstart" 
  fi
done<"$blast"

