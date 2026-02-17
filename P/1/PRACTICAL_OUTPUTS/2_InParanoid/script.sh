#!/usr/bin/env bash

conda activate phylogenomics_p1

# We are going to use Inparanoid to predict orthologs between two species: Acyrthosiphon pisum and Myzus persicae. Open inparanoid.pl and adjust parameters if needed ($use_outgroup = 0). Make sure the matrix you are going to use is in the folder as well as the two fasta files. Also make sure the lines for seqstat and blast_parser.pl are pointing to the folder where the programs are.


cd "/mnt/c/Users/1244149/OneDrive - UAB/DOCENCIA/UPC/PhyloGenomics&CG/phylogenomics/P/1/PRACTICAL_OUTPUTS/2_InParanoid"
DIR="."

perl inparanoid.pl ACYPI.fa MYZPE.fa

# save outputs to no_outgroup

mkdir $DIR/no_outgroup
mv $DIR/table.ACYPI.fa-MYZPE.fa $DIR/no_outgroup/
mv $DIR/Output.ACYPI.fa-MYZPE.fa $DIR/no_outgroup/

# Run inparanoid with an outgroup (SIPHA.fa). We may need to modify the parameters in the script first ($use_outgroup = 1)
perl inparanoid_outgroup.pl ACYPI.fa MYZPE.fa SIPHA.fa

# Aligning the sequence Phy00BX1KU_ACYPI against the proteomes of MYZPE and SIPHA (see question 2.4)

#grep "Phy00BX1KU_ACYPI" $DIR/ACYPI.fa -A 28 >  $DIR/Phy00BX1KU_ACYPI.fa
seqtk subseq ACYPI.fa <(echo "Phy00BX1KU_ACYPI") > Phy00BX1KU_ACYPI.fa
cat $DIR/MYZPE.fa $DIR/SIPHA.fa > $DIR/MYZPE-SIPHA.fa
blastp -query $DIR/Phy00BX1KU_ACYPI.fa -subject $DIR/MYZPE-SIPHA.fa -outfmt 6 -out with_outgroup/Phy00BX1KU_ACYPI.vs.MYZPE-SIPHA.outfmt6

