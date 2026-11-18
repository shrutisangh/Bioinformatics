#!/usr/bin/env bash
# Multiple sequence alignment of globins with Clustal Omega and Kalign
# Not yet verified on this machine: check the options with `clustalo --help` and `kalign --help`.

sudo apt-get update
sudo apt-get install -y clustalo kalign

mkdir -p ~/bioinfo_lab9
cd ~/bioinfo_lab9
# place globins.fasta in this folder

# Clustal Omega: FASTA output, then Clustal output with full distance matrix
clustalo -i globins.fasta -o globins_clustalo.aln --outfmt=fasta --force
clustalo -i globins.fasta -o globins_clustalo.clustal --outfmt=clustal --full --distmat-out=dist_matrix.txt --force

# Kalign
kalign -i globins.fasta -o globins_kalign.aln -f fasta

# Timing
time clustalo -i globins.fasta -o /dev/null --force
time kalign -i globins.fasta -o /dev/null

# Inspect results
head -n 35 globins_clustalo.clustal
cat dist_matrix.txt

# Optional: PHYLIP output for RAxML or IQ-TREE
# clustalo -i globins.fasta -o globins.phy --outfmt=phylip --force
