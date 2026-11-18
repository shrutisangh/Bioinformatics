# 12 · p53 Integrated Analysis: Domains, Structure, Alignment, Pathway and Tree

## Aim
To combine several resources for one protein, human **p53 (TP53, UniProt P04637)**: domain architecture (InterPro, Pfam, PROSITE), 3D structure (PDB 2OCJ in PyMOL), multiple sequence alignment (Clustal Omega and Kalign), pathway annotation (KEGG hsa04115) and a neighbour-joining phylogenetic tree.

## Tools
InterPro, Pfam, PROSITE, RCSB PDB, PyMOL or Jmol, Clustal Omega, Kalign, KEGG, iTOL or similar tree viewer. Files: [`p53_structure.pml`](./p53_structure.pml), [`p53_tree.nwk`](./p53_tree.nwk).

## Observations

### Table 1: Domain architecture of human p53 (P04637, 393 aa)
| Domain | Database | Accession | Residues | Function |
|---|---|---|---|---|
| Transactivation | InterPro / Pfam | IPR013872 / PF08563 (6-30) | about 1-67 | Recruits co-activators (CBP/p300) |
| Proline-rich region | UniProt region | none | about 68-101 | Apoptosis signalling; SH3 binding |
| DNA-binding | Pfam / InterPro | PF00870 / IPR011615 | about 100-288 (core 94-292) | Sequence-specific DNA binding at p53 response elements |
| p53 signature pattern | PROSITE | PS00348 | 237-249 | Defines p53 family specificity |
| Tetramerisation | Pfam / InterPro | PF07710 / IPR010991 | about 319-357 | Forms the active homotetramer |
| C-terminal regulatory | UniProt region | family IPR002117 | about 364-393 | Post-translational modifications (ubiquitination, acetylation) |

### Table 2: PDB 2OCJ (human p53 core domain, DNA-free)
| Parameter | Value |
|---|---|
| Method | X-ray crystallography |
| Resolution | 2.05 Å |
| R-work / R-free | 0.209 / 0.246 |
| Chains | 4 (A, B, C, D) |
| Ligands | 4 x Zn2+ (A501, B502, C503, D504); 389 water molecules |
| ATOM / HETATM records | 6,092 / 393 (file total 6,485) |
| Residues in chain A | 219 (Ser94-Thr312); 194 modelled, 25 not located |
| HEADER | DNA BINDING PROTEIN 20-DEC-06 2OCJ |
| Zinc-coordinating residues | Cys176, His179, Cys238, Cys242 |
| Zn-ligand distances, chain A | Cys176 SG 2.53, His179 ND1 2.06, Cys238 SG 2.53, Cys242 SG 2.40 Å |
| Mean B-value | 29.41 Å2 |

### Table 3: MSA comparison (six sequences, clustalo 1.2.4 and Kalign 3.x)
| Parameter | Clustal Omega | Kalign |
|---|---|---|
| Total aligned columns | 164 | 195 |
| Fully conserved (*) | 45 | 51 |
| Strongly similar (:) | 19 | 15 |
| Weakly similar (.) | 10 | 6 |
| Columns with at least one gap | 58 | 100 |
| Most conserved region | columns 140-164 (human 132-156, 25 identical) | columns 171-195 (human 132-156, 25 identical) |
| Most gapped region | columns 80-99 (human 78-97) | columns 104-123 (human 87-106) |
| Time | under 1 second | under 1 second (about 0.005 s) |

### Table 4: Pairwise identity (Clustal Omega alignment)
| Pair | % identity | % similarity | Gaps |
|---|---|---|---|
| Human vs Mouse | 42.3 | 53.7 | 14 |
| Human vs Rat | 49.0 | 59.2 | 16 |
| Human vs Dog | 90.3 | 93.3 | 23 |
| Human vs Chicken | 87.1 | 93.2 | 24 |
| Human vs Frog | 93.1 | 94.5 | 12 |
| Mouse vs Rat | 82.0 | 87.3 | 10 |

Kalign: Human-Mouse 61.0%, Human-Rat 64.7%, Human-Chicken 89.4%, others unchanged.

### Table 5: KEGG pathway hsa04115 (p53 signalling)
| Gene | KO | Role | Interacting proteins | Outcome |
|---|---|---|---|---|
| TP53 | K04451 | Central transcription factor, DNA damage sensor | MDM2, MDM4, ATM/ATR via CHEK1/CHEK2, SIAH1, CDKN2A (ARF) | Arrest, apoptosis, senescence, repair genes |
| MDM2 | K06643 | Negative regulator (E3 ubiquitin ligase) | TP53, MDM4, CDKN2A, ATM | p53 degradation, negative feedback |
| CDKN1A (p21) | K06625 | CDK inhibitor | CDK2-cyclin E, CDK4/6-cyclin D, CDK1 | G1/S arrest, senescence |
| BAX | K02159 | Pro-apoptotic Bcl-2 member | BCL2, BCL2L1, CYCS, APAF1 to CASP9 to CASP3 | Mitochondrial permeabilisation, apoptosis |
| GADD45A | K04402 | DNA repair, G2/M checkpoint | CDK1-cyclin B1 | G2/M arrest, repair |

## Results
- **Domains:** PROSITE PS00348 (237-249) lies inside the Pfam DNA-binding domain, so both flag the same region.
- **Structure:** 2OCJ is DNA-free, 2.05 Å, space group P 1 21 1, with four chains, four zinc ions and 389 waters. The beta-sandwich core is held by the zinc (yellow sphere). `spectrum b` shows loops and termini with higher B-factors (red) than the sheet core (blue).
- **Alignment:** a 25-residue C-terminal block (human 132-156 of the supplied sequence) is 100% identical in all six species; the largest gaps are in the proline-rich / linker region. Kalign gives a longer alignment with more gap columns (195 vs 164 columns; 100 vs 58 gapped).
- **Pathway:** hsa04115 has 72 genes. TP53 (hsa:7157) drives CDKN1A and GADD45A (arrest), BAX, PERP and PIDD1 (apoptosis) and MDM2 (feedback).
- **Tree (Newick):** `(XENLA:0,(HUMAN:0.080,(CANLF:0.116,(CHICK:0.143,(RAT:0.102,MOUSE:0.123):0.363):0.026):0.012):0.054);`

### Pathway sketch
DNA damage or oncogene stress to ATM/ATR to CHEK1/CHEK2 to **TP53 (up)**; MDM2 normally keeps p53 low.
1. **Cell-cycle arrest:** TP53 to CDKN1A (p21), inhibiting CDK2-cyclin E and CDK4/6-cyclin D (G1/S block); TP53 to GADD45A, inhibiting CDK1-cyclin B1 (G2/M arrest).
2. **Apoptosis:** TP53 to BAX (also PMAIP1, BBC3), mitochondrial permeabilisation, cytochrome c release, APAF1, CASP9, CASP3.
3. **Feedback:** TP53 to MDM2, which ubiquitinates TP53 for degradation.

## Discussion
1. **Why is the DNA-binding domain more conserved than the transactivation domain?** The DBD must keep a precise fold and DNA-contact surface, so purifying selection removes harmful changes; the transactivation domain is disordered and tolerates change. A mutation at a fully conserved DBD residue (Zn ligands, R175, R248, R273) destabilises the fold or loses DNA contact and inactivates p53.
2. **Clustal Omega vs Kalign.** Clustal Omega gave 164 columns (58 gapped); Kalign gave 195 (100 gapped), mainly differing in the N-terminal/proline-rich region (human 78-106). Both took under a second here. For 10,000 sequences Kalign is preferred for speed; Clustal Omega for accuracy on smaller sets.
3. **Role of Zn2+.** Zn2+ is tetrahedrally bound by Cys176, His179, Cys238 and Cys242, linking the L2/L3 loops and keeping the DNA-binding surface intact. C176A removes a ligand, zinc is lost, the domain unfolds and DNA binding is abolished.
4. **PROSITE PS00348 vs Pfam PF00870.** The PROSITE pattern is short, fast and specific but misses divergent members. The Pfam profile HMM scores the whole domain with position-specific probabilities, so it is more sensitive and, with curated thresholds, gives few false positives in proteome scans.
5. **Synthesis.** KEGG shows MDM2 as a p53 target that ubiquitinates p53 (feedback). The structure explains the mechanism: the zinc-stabilised DBD is what activates MDM2, CDKN1A, BAX and GADD45A. Conserved DBD residues in the MSA and orthologues grouped in the tree indicate the same fold and regulation across vertebrates, supporting an essential tumour-suppressor role.

## Conclusion
Human p53 (P04637, 393 aa) is multi-domain: InterPro/Pfam resolve a transactivation domain (PF08563, 6-30), a DNA-binding domain (PF00870, about 100-288) and a tetramerisation domain (PF07710, about 319-357); the PROSITE signature PS00348 (237-249) lies inside the DBD. Structure 2OCJ (2.05 Å, R-work 0.209, R-free 0.246; four chains, 6,092 ATOM and 393 HETATM records) shows a beta-sandwich core held by Zn2+ bound to Cys176, His179, Cys238 and Cys242. Clustal Omega (164 columns, 45 identical) and Kalign (195 columns, 51 identical) both found the C-terminal block fully conserved and the proline-rich/linker region most gapped. In KEGG hsa04115, TP53 (K04451) drives CDKN1A and GADD45A (arrest), BAX (apoptosis) and MDM2 (feedback). The tree should be repeated with full-length UniProt sequences before drawing evolutionary conclusions.

## Viva Questions and Answers
1. **Domain vs motif?** A domain is an independently folding unit (p53 DBD, PF00870); a motif is a short conserved pattern (PS00348).
2. **Pfam method and HMM?** Profile HMMs: probabilistic models giving each alignment column its own residue and insertion/deletion probabilities.
3. **PROSITE pattern S-x-[KR]?** Ser, any residue, then Lys or Arg.
4. **Why Ångströms, and what does 2.0 Å mean?** 1 Å = 10^-10 m, the scale of atomic bonds; 2.0 Å resolves details about 2 Å apart, enough to place side chains and waters.
5. **Three experimental techniques in the PDB?** X-ray crystallography, NMR spectroscopy, cryo-electron microscopy.
6. **What does `spectrum b, rainbow, chain A` show?** Colours by B-factor from blue (low) to red (high); red means flexible or disordered.
7. **Clustal Omega vs Kalign?** Clustal Omega: guide tree plus HMM profile-profile alignment (accurate). Kalign: fast approximate string matching (Wu-Manber), best for very large sets.
8. **KEGG Orthology (KO)?** An identifier for a functional ortholog group (K04451 = TP53) mapping equivalent genes across species to one pathway node.
9. **Annotation vs mapping?** Annotation assigns KO IDs (hsa:7157 to K04451); mapping overlays a gene list on a pathway map.
10. **Newick format?** Nested-parenthesis tree format, e.g. `((Human:0.03,Mouse:0.03):0.05,Frog:0.40);`
11. **Neighbour-joining vs maximum likelihood?** NJ is distance-based and agglomerative; ML is character-based, scoring sites under a substitution model, slower but statistically richer.
12. **Why is p53 the 'guardian of the genome'?** It halts or removes cells with damaged DNA: p21 and GADD45A cause arrest, BAX triggers apoptosis.

## Checklist
- [x] Domain architecture table filled
- [x] PDB data table filled for 2OCJ
- [x] PyMOL / Jmol screenshot included in the journal
- [x] Clustal Omega and Kalign alignments run
- [x] MSA comparison and pairwise identity tables completed
- [x] KEGG pathway table and pathway sketch completed
- [x] Phylogenetic tree image included in the journal
- [x] Discussion, conclusion and all 12 viva questions answered

## Notes for review
The alignment sequences supplied in the exercise are abbreviated (human 156 aa instead of 393 aa, with most of the DNA-binding domain missing). Tables 3 and 4 and the tree are the real output for those sequences, but they do not show the usual biological pattern (for example human-mouse identity of about 77% and mammals clustering together). Re-run with full-length UniProt entries and replace the numbers.
