# BASIC R COMMUNTIY ANALYSIS ---------
# Michigan State University
# written by Gian MN Benucci
# Dec 20, 2018

# load packages ---------------------
library(phyloseq)
library(Biostrings)
library(ggplot2)
library(indicspecies)
library(vegan)

# create a phyloseq object ----------
morel_otus <- read.delim("otu_table.txt",
                         row.names=1) 
head(morel_otus)
dim(morel_otus)
str(morel_otus)

morel_otus_phy <-otu_table(morel_otus,
                           taxa_are_rows = TRUE)
morel_otus_phy
str(morel_otus_phy)

morel_metadata <-read.delim("mapping.txt",
                            row.names=1)
morel_metadata
morel_metadata_phy <-sample_data(morel_metadata)
morel_metadata_phy

morel_taxonomy<-read.delim("consensus_taxonomy.txt",
                           header=TRUE, 
                           row.names=1)
morel_taxonomy

morel_taxonomy_phy <- tax_table(as.matrix(morel_taxonomy))
morel_taxonomy_phy

morel_otus_rep_seq <- readDNAStringSet("otus_rep.fasta", format="fasta", seek.first.rec=TRUE, use.names=TRUE)
morel_otus_rep_seq

physeq_object <- phyloseq(morel_otus_phy, 
                          morel_metadata_phy, 
                          morel_taxonomy_phy,
                          morel_otus_rep_seq)
physeq_object
str(physeq_object)

# filtering dataset --------------------

any(tax_table(physeq_object) == "Unclassified")
any(tax_table(physeq_object) == "Protista")

physeq_object <- subset_taxa(physeq_object, Kingdom == "Fungi")
physeq_object

tax_table(physeq_object)[tax_table(physeq_object)==""]<- "Unclassified"
tax_table(physeq_object)


# >>> Filtering out OTUs ----------------------------------
# Oliver et al. 2015, PCR errors and tag switching
# Lindhal et al. 2013, tag switching - that's a good  one!
# Barberan et al. 2012, removing OTUs that appear in less than x samples

physeq_object -> physeq_object_filt
otu_table(physeq_object_filt)[otu_table(physeq_object_filt) <= 4] <- 0 ### tag switching
otu_table(physeq_object_filt) <- otu_table(physeq_object_filt)[which(rowSums(otu_table(physeq_object_filt)) >= 10),] ### PCR Errors 
physeq_object_filt

# OTUs that are found in at least 5% of samples 
library(metagMisc)
physeq_object_filt <- phyloseq_filter_prevalence(physeq_object_filt, prev.trh = 0.05, abund.trh = NULL)
physeq_object_filt

...
