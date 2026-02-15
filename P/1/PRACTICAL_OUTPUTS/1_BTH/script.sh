#!/usr/bin/env bash

conda activate phylogenomics_p1

# We start by running local blast search to compare each proteome to the other. In order to run a local blast search we first need to build a blast database which can be done with makeblastdb. Then we run blastp. For detailed options you can consult the different manuals using -help


cd "/mnt/c/Users/1244149/OneDrive - UAB/DOCENCIA/UPC/PhyloGenomics&CG/phylogenomics/P/1/PRACTICAL_OUTPUTS/1_BTH"
DIR="."

makeblastdb -dbtype prot -in $DIR/INPUT/ACYPI.fa
makeblastdb -dbtype prot -in $DIR/INPUT/MYZPE.fa
blastp -db $DIR/INPUT/ACYPI.fa -query $DIR/INPUT/MYZPE.fa -outfmt 6 -evalue 0.01 -out $DIR/INPUT/MYZPE2ACYPI.blast
blastp -db $DIR/INPUT/MYZPE.fa -query $DIR/INPUT/ACYPI.fa -outfmt 6 -evalue 0.01 -out $DIR/INPUT/ACYPI2MYZPE.blast

# Run the get_BRH.py script to obtain the pairs of best reciprocal hits:
python $DIR/get_BRH.py -s1 $DIR/INPUT/ACYPI.fa -s2 $DIR/INPUT/MYZPE.fa -h1 $DIR/INPUT/ACYPI2MYZPE.blast -h2 $DIR/INPUT/MYZPE2ACYPI.blast -t OUTPUT/TRY1

# output generated: TRY1.unpaired.txt TRY1.BRH.txt

