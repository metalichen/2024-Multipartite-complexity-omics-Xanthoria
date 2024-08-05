#!/usr/bin/bash
set -e

fasta=$1
out=$2

source package 46a62eca-4f8f-45aa-8cc2-d4efc99dd9c6

seqkit replace -sp '$' -r 'NNNNNNNNNNNNNNNNNNNNNNNNNNNN' $fasta > $out


