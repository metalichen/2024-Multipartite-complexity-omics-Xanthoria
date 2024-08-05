#!/usr/bin/bash
set -e

query=$1
subject=$2
output=$3
folder=`dirname $3`
name="${output%.*}"

source package /tsl/software/testing/bin/blast+-2.9.0  
source package /tgac/software/testing/bin/seqkit-0.10.0
mkdir -p $folder

sed 's, ,_,g' -i $subject

blastp -query $query -subject $subject -outfmt 6 -out "$name".blast -evalue 1e-10
linenum=$(wc -l < "$name".blast)
if (($linenum > 1)); then
  printf '%s\n' "BLAST doesn't give single hit'" 
  echo "BLAST gives multiple hits" > "$name".warning
fi

if (($linenum < 1)); then
  printf '%s\n' "BLAST doesn't give single hit'" 
  echo "no good BLAST  hit" > "$name".warning
fi


cat "$name".blast | head -n 1 | awk '{ print $2 }' | xargs -I{} seqkit grep -n -p {} $subject > $output
