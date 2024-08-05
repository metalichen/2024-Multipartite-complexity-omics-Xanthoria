####
#
# Functions for adding readable columns to sample information
#
####

get_species <- function(s){

  s <- stringr::str_extract(s, "\\d+([XTHNCA]+)")
  s <- gsub("\\d+", "", s)
  return(s)

}

get_fungus <- function(s){
  species <- get_species(s)
  f <- stringr::str_match(species, "[XNC]") #X xanthoria, N a.nidulans, C cladonia portentosa
  s2l <- c("xanthoria_parietina", "aspergillus_nidulans", "cladonia_portentosa")
  names(s2l) <- c("X","N","C")
  s2l[f]
}

get_alga <- function(s){
  species <- get_species(s)
  a <- stringr::str_match(species, "[TAH]") #T trebouxia, a asterochloris, h chlorella sorokiniana
  s2l <- c("trebouxia", "asterochloris", "chlorella_sorokiniana")
  names(s2l) <- c("T","A","H")
  s2l[a]
}

get_biorep <- function(s){
  s <- stringr::str_extract(s, "(\\d+)_KS$")
  stringr::str_replace(s, "_KS", "")
}

get_pair <- function(fungus, alga){
  paste(fungus, alga, sep="+") %>%
  stringr::str_replace( "\\+NA","") %>%
  stringr::str_replace( "NA\\+","")
}

expand_column_info <- function(sample_info) {
  sample_info %>%
    dplyr::mutate(
      timepoint = as.numeric(stringr::str_extract(samples, "^\\d+")),
      fungus = get_fungus(samples),
      alga = get_alga(samples),
      pair = get_pair(fungus, alga),
      medium = dplyr::if_else(stringr::str_detect(samples, "BMM"), "BMM", "WA"),
      biorep = get_biorep(samples)
    ) %>%
    dplyr::select(
      project_name, timepoint, fungus, alga, pair, biorep, medium, samples, run, run_id, runfiles, Insert
    )

}

#############################


make_expected_samples <- function() {
  exp_pairs <- c("xanthoria_parietina+trebouxia",
                 "xanthoria_parietina+asterochloris",
                 "xanthoria_parietina+chlorella_sorokiniana",
                 "xanthoria_parietina",
                 "asterochloris",
                 "chlorella_sorokiniana",
                 "cladonia_portentosa+trebouxia",
                 "aspergillus_nidulans+trebouxia",
                 "trebouxia",
                 "cladonia_portentosa",
                 "aspergillus_nidulans")
  exp_times <- c(48, 9, 21, 42) #48 is in h! rest are in d! FML! ..
  exp_bio_rep <- 1:3
  exp_medium <- c("WA", "BMM")

  exps <- expand.grid(exp_pairs, exp_times, exp_bio_rep, exp_medium)
  names(exps) <- c("pair", "timepoint", "bio_rep", "medium")
  dplyr::select(exps, pair, timepoint, bio_rep, medium)
  return(exps)
}
