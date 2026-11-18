# 02 · Nucleotide Sequence Databases

## Aim
To explore primary (archival), secondary (curated) and specialised nucleotide databases using the human gene **BRCA1**, to read FASTA and GenBank flat files, and to link sequences to clinical information through OMIM, dbSNP and ClinVar.

## Tools
GenBank, RefSeq, ENA (EMBL-EBI), OMIM, dbSNP, ClinVar.

## Observations

### Table 1: Sequence databases
| Database | Type | Accession | Length | Curation status |
|---|---|---|---|---|
| GenBank (NCBI) | Primary | HV746005.1 | 21 bp | Primary, archival |
| RefSeq (NCBI) | Secondary | NM_007294.4 (BRCA1 mRNA, transcript variant 1) | - | Secondary, curated |
| ENA (EMBL-EBI) | Primary | HV746005 | 21 bp | Primary, archival |

### Table 2: Specialised databases
| Database | Record ID | Key biological or clinical information |
|---|---|---|
| OMIM | 604370 (phenotype entry) | Familial breast-ovarian cancer 1; BRCA1 functions in DNA repair, cell-cycle checkpoint control and genomic stability |
| dbSNP | rs12516 | Single nucleotide variant (SNV) |
| ClinVar | RCV000119243.8 | Breast-ovarian cancer, familial, susceptibility to, 1 |

## Results

### GenBank record HV746005.1
- Definition: JP 2012090627-A/69: Coding Sequences of the Human BRCA1 Gene
- LOCUS: HV746005, 21 bp, DNA, linear, division PAT, dated 29-SEP-2012
- Organism: *Homo sapiens*; source of the record is a patent (JP 2012090627-A, Myriad Genetics)

### RefSeq FASTA: NM_007294.4 (first 80 bp)
```
>NM_007294.4 Homo sapiens BRCA1, mRNA transcript variant 1
GTCGACCTGCCTGTCACTTTGGCGCGTGCGGGGTCACACGTGGGCTCGGGATAACGGGGGAGACTTCGGCGGCGGGGGTG
```

### OMIM: BRCA1
- Alternative title: BREAST CANCER 1 GENE; HGNC symbol BRCA1
- Cytogenetic location 17q21.31; genomic coordinates (GRCh38) 17:43,044,295-43,170,327

| Location | Phenotype | Phenotype MIM | Inheritance |
|---|---|---|---|
| 17q21.31 | Breast-ovarian cancer, familial, 1 | 604370 | AD |
| 17q21.31 | Pancreatic cancer, susceptibility to, 4 | 614320 | - |
| 17q21.31 | Fanconi anemia, complementation group S | 617883 | AR |

### dbSNP: rs12516 (Build 157, released 3 September 2024)
- Organism *Homo sapiens*; position chr17:43044391 (GRCh38.p14); alleles G>A / G>C / G>T; variation type SNV
- Frequency: A=0.351913 (GnomAD exomes), A=0.291651 (TOPMED), A=0.317476 (ALFA)
- Gene consequence: BRCA1, non-coding transcript variant; clinical significance reported in ClinVar; 17 citations

## Discussion
1. **Why do primary databases contain redundant entries, and how do secondary databases solve this?** Primary databases (GenBank, ENA, DDBJ) accept sequences directly from submitters, so the same gene can be deposited many times by different labs, strains and patents, with varying quality. Secondary databases such as RefSeq curate and merge these into one non-redundant, reviewed reference record.
2. **What is the INSDC and why is daily synchronisation critical?** The International Nucleotide Sequence Database Collaboration links GenBank (NCBI), ENA (EMBL-EBI) and DDBJ (Japan). Daily exchange keeps all three identical, so a sequence submitted anywhere is available everywhere under the same accession.
3. **LOCUS line vs ORIGIN section.** The LOCUS line is the header summary: name, length, molecule type, topology, division and date. The ORIGIN section holds the actual nucleotide sequence in numbered blocks.
4. **How does OMIM bridge sequences with clinical data?** OMIM links a gene and its location (BRCA1, 17q21.31) to disease phenotypes, inheritance pattern, MIM numbers and literature, connecting the sequence to diagnosis.

## Conclusion
Biological databases play an important role in storing, organizing and analyzing genetic information. Archival databases such as GenBank store submitted sequences, while reference databases such as RefSeq provide curated and standardized records. FASTA files contain a header beginning with `>` followed by the sequence, whereas GenBank files include annotations such as locus information, accession numbers, features and sequence data. Genetic variations are recorded in dbSNP using rs numbers, while ClinVar describes the clinical significance of variants and their relationship to disease. Together these databases support genetic research, sequence comparison, disease analysis and understanding of human genetic variation.

## Viva Questions and Answers
1. **What is GenBank? Who maintains it?** A public database of nucleotide sequences submitted by researchers, maintained by NCBI (part of the NLM, USA).
2. **What is RefSeq? Three differences from GenBank?** A curated, non-redundant reference sequence database. Differences: it is curated (GenBank archives submissions), it is non-redundant, and it uses prefixes such as NM_, NC_, NP_.
3. **Accession suffix versions (.1, .2)?** The suffix is the sequence version. A new version is issued when the sequence changes; annotation-only changes do not change the version.
4. **FASTA header layout?** A line starting with `>` followed by an identifier and optional description; the sequence lines follow.
5. **INSDC and its members?** International Nucleotide Sequence Database Collaboration: GenBank (NCBI, USA), ENA (EMBL-EBI, Europe), DDBJ (Japan).
6. **Locus in a GenBank file?** The first record line giving identifier, length, molecule type, topology, division and date.
7. **NC_, NM_, NP_?** NC_ complete genomic molecules (chromosomes); NM_ curated mRNA; NP_ curated protein.
8. **What does ClinVar do?** NCBI database of genetic variants and their relationship to health and disease, with clinical interpretations, evidence and review status.
9. **dbSNP and 'rs'?** NCBI database of small variations (SNVs, small indels); rs means reference SNP, e.g. rs123456.
10. **mRNA vs genomic sequence?** Genomic DNA contains exons, introns and regulatory regions (A, T, G, C); mature mRNA contains spliced exons and UTRs (A, U, G, C).

*Tip: GenBank is archival, RefSeq is reference, dbSNP identifies variants, ClinVar gives their clinical significance.*

## Checklist
- [x] Aim and objectives completed
- [x] FASTA and GenBank files downloaded
- [x] Observation tables filled with BRCA1 information
- [x] Screenshots attached for NCBI and dbSNP
- [x] Discussion and viva answered

## Notes for review
- The journal listed **HV746005** as the RefSeq accession. HV746005 is a GenBank patent record; RefSeq accessions use NM_, NC_ or NP_ prefixes. The table uses **NM_007294.4**, which appears in the Results.
- **604370** is the *phenotype* MIM number (familial breast-ovarian cancer 1). The BRCA1 *gene* entry in OMIM is **113705**.
- The journal header for dbSNP/ClinVar says rs397507246, but the record shown is **rs12516**. Check that both rs numbers belong to the same variant.
- The column heading 'OORH(bp)' in the journal looks like a typo for sequence length (bp).
