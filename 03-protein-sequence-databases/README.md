# 03 · Protein Sequence Databases

## Aim
To retrieve and annotate a protein from UniProt (human insulin, P01308), record its processed chains, compare the reviewed Swiss-Prot and unreviewed TrEMBL sections, and download the sequence in FASTA format.

## Tools
UniProtKB, NCBI Protein.

## Observations

### Table 1: Human insulin (UniProt P01308, INS_HUMAN)
| Parameter | Observation |
|---|---|
| Protein name and gene symbol | Insulin, gene INS |
| Organism | *Homo sapiens* (human) |
| Status | UniProtKB reviewed (Swiss-Prot); annotation score 5/5 |
| Protein existence | Evidence at protein level |
| Sequence length | 110 amino acids (about 11.98 kDa) |
| Subcellular location | Secreted |
| Signal peptide | positions 1-24 |
| B chain | positions 25-54 |
| C peptide | positions 57-87 |
| A chain | positions 90-110 |
| Disulfide bonds | 3: Cys31-Cys96, Cys43-Cys109, Cys95-Cys100 |

### Table 2: Swiss-Prot vs TrEMBL
| Feature | Swiss-Prot (reviewed) | TrEMBL (unreviewed) |
|---|---|---|
| Curation method | Manual curation by experts | Automatic computational annotation |
| Annotation quality | High (P01308 scores 5/5) | Lower, varies by entry |
| Redundancy | Non-redundant | Redundant |
| Approximate entries | about 570,000 | about 250 million or more |

## Results
Human insulin was retrieved and saved as `insulin_human.fasta`.
```
>sp|P01308|INS_HUMAN Insulin OS=Homo sapiens OX=9606 GN=INS PE=1 SV=1
MALWMRLLPLLALLALWGPDPAAAFVNQHLCGSHLVEALYLVCGERGFFYTPKTRREAED
LQVGQVELGGGPGAGSLQPLALEGSLQKRGIVEQCCTSICSLYQLENYCN
```
The 110-residue precursor (preproinsulin) is processed into a two-chain mature hormone: the signal peptide (1-24) and the C peptide (57-87) are removed, leaving the B chain (25-54) and the A chain (90-110) joined by disulfide bonds.

## Discussion
1. **Why is post-translational processing critical to mature insulin?** Insulin is made as preproinsulin. The signal peptide is cleaved in the endoplasmic reticulum, disulfide bonds form, and the C peptide is excised, leaving the A and B chains. Only this folded two-chain form binds the insulin receptor and is stored and secreted correctly.
2. **Molecular function vs biological process in Gene Ontology (using insulin).** Molecular function is what the gene product does biochemically (for example hormone activity, insulin receptor binding). Biological process is the larger process it takes part in (for example glucose homeostasis, regulation of insulin secretion).
3. **Why is TrEMBL much larger than Swiss-Prot, and what are the trade-offs?** TrEMBL is generated automatically from translated nucleotide submissions with no manual review. It covers almost everything, including new and rare organisms, but has more redundancy, more errors and less annotation. Swiss-Prot is smaller but reliable.
4. **How does NCBI Protein link to GenBank nucleotide sequences?** A protein record for a coding sequence carries cross-links to the nucleotide record it was translated from, so the NP_ protein record connects back to its mRNA record and, through it, to the genomic sequence.

## Conclusion
Protein sequence databases are essential for retrieving protein information and understanding biological function. UniProt provides sequences with annotations such as protein names, biological roles, subcellular locations, domains and post-translational modifications. Signal peptides direct newly synthesized proteins to secretory pathways and are removed during maturation. Preproinsulin contains a signal peptide, B chain, C peptide and A chain, whereas mature insulin consists of the A and B chains linked by disulfide bonds. UniProt distinguishes manually curated annotation, reviewed by experts, from automated annotation generated computationally. Understanding these features helps researchers retrieve reliable protein information and relate protein structure to function.

## Viva Questions and Answers
1. **What is UniProt? Who maintains it?** The Universal Protein Resource, maintained by the UniProt Consortium: EMBL-EBI, the Swiss Institute of Bioinformatics (SIB) and the Protein Information Resource (PIR).
2. **Swiss-Prot vs TrEMBL?** Swiss-Prot is manually reviewed and curated; TrEMBL is computationally analysed and not yet fully reviewed.
3. **Function of a signal peptide?** A short N-terminal sequence that directs a new protein to its destination, often the endoplasmic reticulum for secretion, and is usually cleaved off.
4. **Preproinsulin vs mature insulin?** Preproinsulin has signal peptide, B chain, C peptide and A chain in one polypeptide; mature insulin is only the A and B chains joined by disulfide bonds.
5. **Cysteines in human insulin and their role?** Six cysteines form three disulfide bonds (two between A and B chains, one inside the A chain) that stabilise the structure and activity.
6. **What is Gene Ontology and its three categories?** A standard vocabulary for gene product function: Biological Process, Molecular Function, Cellular Component.
7. **Entry name vs accession?** The entry name (INS_HUMAN) is descriptive; the accession (P01308) is the stable unique identifier.
8. **What does PIR stand for?** Protein Information Resource, one of the UniProt consortium members.
9. **What is a PTM? Two examples.** A chemical change after synthesis, for example phosphorylation and glycosylation; they alter activity, stability, localisation and interactions.
10. **How to find papers linked to a UniProt entry?** Search the name or accession, open the entry, go to Publications or References, then follow the PubMed or DOI links.

## Checklist
- [x] Aim and objectives completed
- [x] Insulin processing ranges recorded
- [x] Swiss-Prot / TrEMBL comparison completed
- [x] FASTA sequence downloaded
- [x] Screenshots of P01308 and NP_000199 attached
- [x] Discussion and viva answered

## Notes for review
The journal recorded: subcellular location 'Cellular component'; B chain 31-96; C peptide 43-109; A chain 25-54; disulfide bonds '43-109'. These do not match UniProt P01308. The corrected values above are signal peptide 1-24, B chain 25-54, C peptide 57-87, A chain 90-110, three disulfide bonds, location Secreted. Please confirm them against the entry before submitting.
