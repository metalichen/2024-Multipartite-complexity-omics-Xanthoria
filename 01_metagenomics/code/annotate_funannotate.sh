#!/usr/bin/bash
set -e

assemblymasked=$1
filename=$(basename $assemblymasked)
dummy=`dirname $2`
outdir=`dirname $dummy`
prefix=$3
thread=$4
lineage=$5
bin=$6

#define params that differ for fungi and alga
if [[ $lineage = "fungus" ]]
then
   organism="fungus"
   busco_lineage="dikarya"
   busco_seed_species="anidulans"
else
   organism="other"
   busco_lineage="chlorophyta_odb10"
   busco_seed_species="chlamydomonas"
fi


#genemark
source genemark_ES_ET_EP-4.62_CBG 
mkdir -p "$outdir"/genemark
cd "$outdir"/genemark
gmes_petap.pl --ES --max_intron 3000 --soft_mask 2000 --cores $thread --sequence ../../$filename
cd /tsl/scratch/gol22pin/01_Xanthoria_metagenomics

#funannotate
SINGULARITYENV_PATH=/venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin SINGULARITYENV_AUGUSTUS_CONFIG_PATH=/usr/share/augustus/config SINGULARITYENV_EVM_HOME=/venv/opt/evidencemodeler-1.1.1 singularity exec ../singularity/funannotate2 funannotate predict -i $assemblymasked -o $outdir --optimize_augustus --cpus $thread --name $prefix -s $bin --organism $organism --busco_db $busco_lineage --genemark_gtf $outdir/genemark/genemark.gtf -d /opt/databases --busco_seed_species $busco_seed_species
