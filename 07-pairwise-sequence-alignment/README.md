# 07 · Pairwise Sequence Alignment: Global and Local

## Aim
To align human TP53 (P04637) with mouse Trp53 (P02340) using a global algorithm (EMBOSS Needle) and a local algorithm (EMBOSS Water), and to compare identity, similarity, gaps and scores.

## Tools
EMBOSS Needle (Needleman-Wunsch), EMBOSS Water (Smith-Waterman), scoring matrix EBLOSUM62 (BLOSUM62).

## Observations
| Statistic | EMBOSS Needle (global) | EMBOSS Water (local) |
|---|---|---|
| Algorithm | Needleman-Wunsch | Smith-Waterman |
| Matrix / gap open / gap extend | BLOSUM62 / 10 / 0.5 | BLOSUM62 / 10 / 0.5 |
| Alignment score | 1547.0 | 1558.0 |
| Alignment length | 396 aa | 393 aa |
| Identity | 304/396 (76.77%) | 304/393 (77.35%) |
| Similarity | 326/396 (82.32%) | 326/393 (82.95%) |
| Gaps | 9/396 (2.27%) | 6/393 (1.53%) |

## Results
Both alignments report the same number of identical (304) and similar (326) positions. The local alignment trims 3 columns of poorly matching ends, so its percentages and score are slightly higher and it has fewer gaps. The first 50 positions of the two outputs are the same, a conserved N-terminal region with the identity markers running almost unbroken.

## Discussion
1. **Why do identity and similarity differ?** Identity counts only exactly matching residues; similarity also counts conservative substitutions with a positive BLOSUM62 score, such as I/L/V, K/R or D/E. Here 326 - 304 = 22 positions are conservative changes, so similarity (82.32%) is higher than identity (76.77%).
2. **When do global and local alignments give identical output?** When the two sequences are similar along their whole length with no divergent ends, so the best local segment is the whole sequence. Here the local result covers 393 of 396 columns, which is almost identical.
3. **Why is gap open much higher than gap extend?** Opening a gap (an insertion or deletion event) is a rare evolutionary event, so it is penalised heavily. Once a gap exists, extending it is more plausible, so the penalty is small. This keeps gaps in single blocks instead of scattered.
4. **Needleman-Wunsch vs Smith-Waterman goals.** Needleman-Wunsch finds the best score over the full length of both sequences (global optimum). Smith-Waterman finds the best-scoring pair of sub-segments; scores are not allowed to fall below zero and the traceback starts at the highest cell.

## Conclusion
Pairwise sequence alignment was performed to compare human TP53 and mouse Trp53 using global and local approaches. EMBOSS Needle implements the Needleman-Wunsch algorithm, which aligns sequences across their entire lengths, whereas EMBOSS Water implements the Smith-Waterman algorithm, which identifies the highest-scoring matching regions. The BLOSUM62 matrix evaluates amino acid substitutions, while gap opening and extension penalties account for insertions and deletions. Percentage identity indicates exact matches, whereas similarity includes conservative substitutions. Global alignment suits related sequences of similar length, while local alignment suits sequences with conserved regions and divergent sections. Comparing scores, identities, similarities and gaps helps assess conservation and evolutionary relationships.

## Viva Questions and Answers
1. **What is pairwise sequence alignment?** Comparing two DNA, RNA or protein sequences to find similarities and differences, and so infer evolutionary, structural and functional relationships.
2. **Global alignment and its algorithm?** Aligns the full length of both sequences; Needleman-Wunsch.
3. **Local alignment and its algorithm?** Finds the most similar regions without aligning whole sequences; Smith-Waterman.
4. **Scoring matrix? Two protein matrices?** A table of scores for amino acid matches and substitutions; BLOSUM62 and PAM250.
5. **What does BLOSUM stand for and what is 62?** Blocks Substitution Matrix, built from conserved protein blocks; 62 is the clustering threshold (sequences more than 62% identical are grouped), not an evolutionary distance.
6. **PAM vs BLOSUM and distance?** PAM1 is a small evolutionary change and higher PAM numbers (PAM250) mean more divergence; for BLOSUM, lower numbers (BLOSUM45) suit distant proteins and higher numbers (BLOSUM80) suit close ones.
7. **Gap penalty and its components?** A negative score for introducing gaps: a gap opening penalty and a gap extension penalty.
8. **Identity vs similarity?** Identity is exact matches; similarity includes identical and chemically similar residues, so similarity is at least identity.
9. **Why are gaps introduced?** To represent insertions or deletions (indels) that occurred during evolution and improve the alignment.
10. **What is dynamic programming here?** Solving the alignment by breaking it into smaller sub-problems whose results are stored in a scoring matrix; used by both Needleman-Wunsch and Smith-Waterman.

## Checklist
- [x] Needle alignment data recorded
- [x] Water alignment data recorded
- [x] Screenshots attached for Needle and Water
- [x] Discussion and viva answered

## Notes for review
The journal's conclusion said the alignment was performed 'conceptually' and ended with a line asking to submit both jobs and share screenshots. That text was removed here; delete it from the journal as well.
