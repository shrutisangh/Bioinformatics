# 09 · Multiple Sequence Alignment: Clustal Omega and Kalign

## Aim
To align globin sequences from five species (human, chimp, mouse, chicken, zebrafish) with Clustal Omega and Kalign on the Linux command line, compare the tools and estimate a distance matrix.

## Tools
Clustal Omega (`clustalo`), Kalign (`kalign`), Ubuntu Linux. Commands are in [`run_msa.sh`](./run_msa.sh).

## Observations

### Table 1: Tool comparison
| Parameter | Clustal Omega | Kalign |
|---|---|---|
| Algorithm class | mBed guide tree + HMM profile-profile alignment | Wu-Manber string matching + dynamic programming |
| Time complexity | O(N log N) | O(N x L + N^2), very fast |
| Total alignment length (with gaps) | to be measured | to be measured |
| 100% identical columns (*) | to be counted | to be counted |
| Total gaps inserted | to be counted | to be counted |
| Execution time | measure with `time` | measure with `time` |

### Table 2: Distance matrix (`dist_matrix.txt`)
| Species | Human | Chimp | Mouse | Chicken | Zebrafish |
|---|---|---|---|---|---|
| Human_HBA | 0.000000 | | | | |
| Chimp_HBA | | 0.000000 | | | |
| Mouse_HBA | | | 0.000000 | | |
| Chicken_HBA | | | | 0.000000 | |
| Zebrafish_HBA | | | | | 0.000000 |

Only the diagonal is filled so far; add the other values from `cat dist_matrix.txt`.

## Results
Clustal Omega and Kalign were installed with `apt-get` and the alignments were run from the command line (terminal screenshot attached in the journal). The commands are in `run_msa.sh`.

## Discussion
1. **Distance matrix analysis.** Read `dist_matrix.txt`: the pair with the smallest distance shares the highest identity, and the species with the largest distances to all others (expected to be zebrafish) is the outgroup, since fish diverged earliest. Fill this in after Table 2 is complete.
2. **Algorithmic scalability.** Classic progressive alignment computes all N(N-1)/2 pairwise distances, O(N^2), which is unmanageable for 100,000 sequences. mBed embeds each sequence as a vector of distances to a small set of seed sequences and clusters these vectors, so the guide tree costs about O(N log N).
3. **Motif and functional site conservation.** The proximal histidine (His87) and distal histidine (His58) are expected to be conserved in all species. Confirm this by checking those columns in both alignments.
4. **Tool selection in pipelines.** Choose Kalign in an automated big-data workflow when thousands to millions of sequences must be aligned quickly and runtime or memory is the limit; choose Clustal Omega when accuracy on a smaller set matters more.

## Conclusion (draft)
Multiple sequence alignment places three or more homologous sequences in a common frame, revealing conserved residues and evolutionary relationships. Clustal Omega builds a guide tree with mBed and aligns profiles with HMMs, giving high accuracy, while Kalign uses a fast string-matching method suited to very large datasets. Execution time and alignment statistics should be compared once measured. The distance matrix summarises how different the sequences are, with closely related species having small distances. The same alignment can be exported in PHYLIP format and used to build a phylogenetic tree.

## Viva Questions and Answers
1. **Pairwise vs MSA?** Pairwise compares two sequences; MSA aligns three or more at once to find conserved regions and relationships.
2. **Three steps of progressive alignment?** Compute distances and build a guide tree; align the most closely related sequences first; add the remaining sequences or profiles following the tree.
3. **Guide tree vs phylogenetic tree?** A guide tree only fixes the order of alignment; a phylogenetic tree is an inferred evolutionary history and should not be read from a guide tree.
4. **How does mBed reach O(N log N)?** It reduces pairwise calculations by using representative seed sequences and efficient clustering.
5. **What do *, : and . mean?** * identical in all sequences; : strongly similar properties; . weakly similar; blank means no conservation criterion is met.
6. **Why Profile HMMs over PSSMs?** They model match, insertion and deletion probabilities per position; a PSSM mainly gives residue scores.
7. **Wu-Manber and Kalign?** An efficient string-matching algorithm used in Kalign's sequence comparison; details depend on the version.
8. **Gap opening vs extension?** Opening discourages new gaps, extension discourages longer ones; the affine model favours one long indel over many short ones.
9. **Converting Clustal Omega output to PHYLIP?** `clustalo -i globins.fasta -o globins.phy --outfmt=phylip --force`, then check the format needed by RAxML or IQ-TREE.
10. **Neutral theory and conserved residues?** Functionally vital residues are under purifying selection, so harmful mutations are removed and these residues change more slowly.

## Checklist
- [x] Aim, objectives and Linux environment configured
- [x] Clustal Omega and Kalign run on the command line
- [ ] Table 1 (parameters and benchmark) and Table 2 (distance matrix) completed
- [x] Terminal screenshot attached
- [ ] Conclusion finalised

## Notes for review
The commands in `run_msa.sh` have not been verified on this system. Check `clustalo --help` and `kalign --help` if an option is rejected, and do not report runtimes or alignment statistics until you have run them. Table 1 values and the off-diagonal distances are still to be filled.
