import re


def get_sample_data(sample_file='data/metadata/found_samples_in_sequences_db.csv'):
    samples = []
    fq1 = []
    fq2 = []
    fungi = []
    algae = []
    fungi_only_samples = []
    algae_only_samples = []
    double_samples = []

    with open(sample_file, 'r') as input:
        for line in input:
            if not line.startswith("project_name"):
                items = line.split(",")
                samples.append(items[9])
                f1, f2 = items[10].split(';')
                fq1.append(f1)
                fq2.append(f2)
                fungi.append(items[2])
                algae.append(items[3])

    for i, s in enumerate(samples):
        if fungi[i] == "NA":
            algae_only_samples.append(s)
        elif algae[i] == "NA":
            fungi_only_samples.append(s)
        else:
            double_samples.append(s)

    return samples, fq1, fq2, fungi, algae, fungi_only_samples, algae_only_samples, double_samples


def coincubation(sample, samples, fungi, algae):
    idx = samples.index(sample)
    if fungi[idx] == "NA" or algae[idx] == "NA":
        return False
    else:
        return True

def partner_to_taxid(sample, samples, fungi, algae, type_req="f"):
    txids = {
        "xanthoria_parietina" :	'107463',
        "trebouxia"	: '285719',
        "chlorella_sorokiniana" :	'3076',
        "asterochloris" :	'174040',
        "aspergillus_terreus" :	'341663',
        "cladonia_portentosa" :	'50943'
    }

    idx = samples.index(sample)

    if coincubation(sample, samples, fungi, algae):
        if type_req == "f":
            return txids[ fungi[idx] ]
        else:
            return txids[ algae[idx] ]
    else:
        if fungi[idx] == "NA":
            return txids[ algae[idx] ]
        else:
            return txids[ fungi[idx] ]

def get_single_genomes_timecourse(sample_file='lib/found_samples_in_sequences_db.csv',selected_samples=None,selected_names=None):
    samples = []
    fq1 = []
    fq2 = []
    names = []
    with open(sample_file, 'r') as input:
        for line in input:
            if not line.startswith("project_name"):
                items = line.split(",")
                if re.match("^NA$", items[2]):

                    names.append(items[3])
                    samples.append(items[9])
                    f1, f2 = items[10].split(';')
                    fq1.append(f1)
                    fq2.append(f2)
                elif re.match("^NA$", items[3]):
                    names.append(items[2])
                    samples.append(items[9])
                    f1, f2 = items[10].split(';')
                    fq1.append(f1)
                    fq2.append(f2)
    if selected_samples:
        idx = [samples.index(s) for s in selected_samples ]
        samples = [samples[i] for i in idx]
        fq1 = [fq1[i] for i in idx]
        fq2 = [fq2[i] for i in idx]
        names = [names[i] for i in idx]
    elif selected_names:
        idx = [i for i, n in enumerate(names) if n in selected_names ]
        samples = [samples[i] for i in idx]
        fq1 = [fq1[i] for i in idx]
        fq2 = [fq2[i] for i in idx]
        names = [names[i] for i in idx]
    
    return samples, fq1, fq2, names


def sample_to_read(sample, samples, reads):
    return reads[samples.index(sample)]


def select_thallus_samples(sample_file = 'lib/found_samples_in_sequences_db.csv', growth_site = None, sample_focus = None):
    samples = []
    with open(sample_file, 'r') as input:
        for line in input:
            if not line.startswith("project_name"):
                items = line.split(",")
                if items[2] == growth_site and items[3] == sample_focus:
                    samples.append(items[5])
    return samples


def get_thallus_info(sample_file='lib/found_samples_in_sequences_db.csv',selected_samples=None,selected_names=None):
    samples = []
    fq1 = []
    fq2 = []
    names = []
    with open(sample_file, 'r') as input:
        for line in input:
            if not line.startswith("project_name"):
                items = line.split(",")
                names.append(items[2])
                samples.append(items[5])
                f1, f2 = items[8].split(';')
                fq1.append(f1)
                fq2.append(f2)

    if selected_samples:
        idx = [samples.index(s) for s in selected_samples ]
        samples = [samples[i] for i in idx]
        fq1 = [fq1[i] for i in idx]
        fq2 = [fq2[i] for i in idx]
        names = [names[i] for i in idx]
    elif selected_names:
        idx = [i for i, n in enumerate(names) if n in selected_names ]
        samples = [samples[i] for i in idx]
        fq1 = [fq1[i] for i in idx]
        fq2 = [fq2[i] for i in idx]
        names = [names[i] for i in idx]
    return samples, fq1, fq2, names


def get_protein_fasta(
    genomic_metadata="lib/sample_metadata/genome_resources.csv",
    selected_assembly = None
    ):
    assembly = []
    faa = []
    with open(genomic_metadata, 'r') as input:
        for line in input:
            line=line.rstrip()
            if not line.startswith("target_species"):
                items = line.split(",")
                if items[1] in selected_assembly:
                    assembly.append(items[1])
                    faa.append(items[5])
    return assembly, faa


def assembly_to_fa(assembly, assembly_list, fa):
    return fa[assembly_list.index(assembly)]

def sample_to_kallisto_index(sample, samples, fungi, algae, type_req="f", base=""):

    kidces = {
        "xanthoria_parietina": 'xanpa.idx',
        "trebouxia": 'trebo.idx',
        "chlorella_sorokiniana": 'chlor.idx',
        "asterochloris": 'aster.idx',
        "aspergillus_terreus": 'asper.idx',
        "cladonia_portentosa": 'clado.idx'
    }
    idx = samples.index(sample)

    if coincubation(sample, samples, fungi, algae):
        if type_req == "f":
            return base + kidces[ fungi[idx] ]
        else:
            return base + kidces[ algae[idx] ]
    else:
        if fungi[idx] == "NA":
            return base + kidces[ algae[idx] ]
        else:
            return base +   kidces[ fungi[idx] ]

def timecourse_main_comparisons(test_time = "NA",
                                control_time = "NA",
                                fungus_test = "NA",
                                alga_test = "NA",
                                fungus_control = "NA",
                                alga_control = "NA"):

    '''this function returns the list of files for the time course main comparisons'''
    pass

#def select_files_for_comparision(test, control, fungus_t, alga_t)