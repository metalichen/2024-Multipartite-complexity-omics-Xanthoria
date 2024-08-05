# 2024-Multipartite-complexity-omics-Xanthoria
Description of analysis associated with Tagirdzhanova et al. 2024: Multipartite complexity of the lichen symbiosis revealed by metagenome and transcriptome analysis of Xanthoria parietina

## Abstract
Lichens are composite symbiotic associations of at least one fungus and an alga or cyanobacterium symbiont, that result in anatomically complex organisms that are adapted to many of the world’s most challenging environments. How such large and complex organisms develop from simple microbial components is largely unknown because of their recalcitrance to experimental manipulation. Here we report a metagenome analysis of the lichen Xanthoria parietina. We identified over 150 genomes of symbionts and lichen-associated microbes within a lichen thallus, including representatives of green algae, three different classes of fungi, and 14 bacterial phyla. We mapped the occurrence of individual species across lichen thalli from diverse environments, identifying both substrate-specific and core microbial components of the lichen. Meta-transcriptomic analysis of the principal fungal symbiont from three different developmental stages of a lichen thallus compared to axenically grown symbiont, revealed gene expression profiles consistent with lichen-specific transporter functions, cell signalling, transcriptional regulation and secondary metabolic capacity. Immunity-related NLR proteins and lichen-specific structurally conserved secreted proteins resembling fungal pathogen effectors were also identified, consistent with immunity modulation being required for lichen assembly.

## Repo Structure
* Repo is broken into four folders corresponding to the four main parts of the manuscript:
	* `01_metagenomics`
	* `02_mycobiont_genome`
	* `03_transcriptomic_analysis`
	* `04_secretome`
* Each folder has following structure:
	* `analysis_and_temp_files`: all files generated during labwork and bioinformatic analysis and retained either for reusing, or for documentation purposes. Broken into subfolders by steps
	* `code`: all scripts associated with the project. Not including RMarkdown files (they are in `notebook`) and Snakemake files (they are in subfolders in `analysis_and_temp_files`)
	* `notebook`: documentation of all labwork and data analysis. Folder contains RMarkdown files used to generate reports, and reports themselves in html. Names match the subfolders of `analysis_and_temp_files`
	* `results`: figures generated for the manuscript
