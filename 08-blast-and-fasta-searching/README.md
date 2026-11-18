# 08 · BLAST and FASTA Searching

## Aim
To identify an unknown ('mystery') protein sequence by database similarity searching with NCBI BLAST (blastp) and EBI FASTA, and to interpret bit scores, query cover and E-values.

## Tools
NCBI BLAST (blastp, non-redundant protein database), EBI FASTA, scoring matrix BLOSUM62.

## Observations

### Table 1: Top 5 BLAST hits
| No. | Description | Accession | Max score | Total score | Query cover | E-value | Identity |
|---|---|---|---|---|---|---|---|
| 1 | truncated breast and ovarian cancer susceptibility protein 1 [*Homo sapiens*] | WXT91735.1 | 508 | 508 | 100% | 0.0 | 100% |
| 2 | truncated BRCA1 [*Homo sapiens*] | XUA29634.1 | 508 | 508 | 100% | 0.0 | 100% |
| 3 | truncated BRCA1 DNA repair associated [*Homo sapiens*] | WLE99398.1 | 506 | 506 | 100% | 0.0 | 100% |
| 4 | truncated breast and ovarian cancer susceptibility protein 1 [*Homo sapiens*] | QCL11113.1 | 507 | 507 | 100% | 3e-179 | 100% |
| 5 | truncated breast and ovarian cancer susceptibility protein 1 [*Homo sapiens*] | UIY90139.1 | 509 | 509 | 100% | 6e-178 | 100% |

### Table 2: Identification
| Parameter | Observation |
|---|---|
| Identified protein | Breast and ovarian cancer susceptibility protein 1 (BRCA1), truncated form |
| Organism | *Homo sapiens* |
| Top-hit E-value (NCBI BLAST) | 0.0 |
| Top-hit E-value (EBI FASTA) | see notes below |

### Scores under different matrices (as recorded)
PAM70: 247 · BLOSUM50: 247 · BLOSUM90: 247

## Results
BLASTp against the non-redundant protein database identified the mystery sequence as human BRCA1: all five top hits are BRCA1 records with 100% query cover and 100% identity, with E-values from 0.0 to 6e-178.

## Discussion
1. **Meaning of E-value 0.0.** The expected number of equally good hits by chance is effectively zero, so the match is extremely significant and not random.
2. **How does BLAST's heuristic speed up searches compared to Smith-Waterman?** Smith-Waterman is exact but too slow for millions of sequences. BLAST finds short word matches between query and database sequences and extends them in both directions, giving up guaranteed optimality for a large gain in speed.
3. **blastn, blastp, blastx.** blastn: nucleotide query vs nucleotide database. blastp: protein vs protein. blastx: translated nucleotide query vs protein database.
4. **BLAST vs FASTA.** BLAST uses word-based seeding and extension; FASTA uses a k-tuple lookup table to find identical segments, joins the best ones and optimises locally. In general BLAST is faster, while FASTA with its fuller local optimisation can be slightly more sensitive for distant relationships.

## Conclusion
This exercise identified an unknown protein sequence with NCBI BLAST and EBI FASTA. Using blastp against the non-redundant database, the query was repeatedly identified as the breast and ovarian cancer susceptibility protein 1 (BRCA1) of *Homo sapiens*. Top hits had E-values of 0.0, showing the matches are highly significant and unlikely to be due to chance, and bit scores measured alignment quality, with higher scores indicating stronger homology. The practical shows how heuristic search tools extract biological information from large sequence databases quickly.

## Viva Questions and Answers
1. **What does BLAST stand for? Who developed it?** Basic Local Alignment Search Tool, developed at NCBI by Altschul and colleagues (1990).
2. **What is the E-value?** The number of hits expected by chance in a database of that size; lower means more significant.
3. **E-value and bit score?** Inversely related: a higher bit score gives a lower E-value.
4. **Query coverage 98%?** 98% of the query length is aligned to the subject.
5. **Five BLAST variants:** blastp (protein vs protein), blastn (nucleotide vs nucleotide), blastx (translated nucleotide vs protein), tblastn (protein vs translated nucleotide), tblastx (translated vs translated).
6. **Default protein matrix in NCBI BLAST?** BLOSUM62.
7. **What is a heuristic algorithm?** A shortcut that finds good, approximate answers quickly by ignoring unpromising regions.
8. **k-tuple in FASTA?** Splitting sequences into short fixed-length words and using a lookup table to find identical segments before detailed alignment.
9. **Local vs global database search?** Local finds the best-matching region (such as a conserved domain); global aligns the whole length of both sequences.
10. **BLAST hit with E-value 2.0?** Not significant; about two such hits are expected by chance.

## Checklist
- [x] BLAST top 5 hits table filled
- [x] Mystery protein identified
- [x] BLAST and FASTA screenshots attached
- [x] Discussion and viva answered

## Notes for review
- The journal recorded the top-hit BLAST E-value as '100'. 100% is the identity; the E-value is **0.0**.
- The EBI FASTA screenshot shows hits for insulin-like growth factor-binding protein complex acid labile subunit (IGFALS), not BRCA1, and **2.2e-31** is the E-value of the fifth hit (LRRC15). The top FASTA hit has E = 0. This suggests a different query was used; re-run FASTA with the BRCA1 sequence and record its top hit.
- In the journal the viva answers were numbered 1-9 against 10 questions, so question 1 had no answer; the list above is renumbered and complete.
