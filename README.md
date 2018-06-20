# DNA-Sequence-Alignment
Perl Implementation of a three different techniques for DNA sequence alignment to calculate similarity between 2 DNA sequences

In *Bioinformatics* there are a technique called [sequence alignment](https://en.wikipedia.org/wiki/Sequence_alignment) 
It is a way of arranging the sequences of DNA, RNA, or protein to identify regions of similarity that may be a consequence of functional, structural, or evolutionary relationships between the sequences.

## Example:

![alt text](https://upload.wikimedia.org/wikipedia/commons/b/b5/Histone_Alignment.png "Protein sequence alignment")

## sequence pair 1:
  TGGTAGATTCCCACGAGATCTACCGAGTATGAGTAGGGGGACGTTCGCTCGG
  GCCTCTAACACACTGCACGAGATCAACCGAGATATGAGTAATACAGCGGTACGGG
  
## sequence pair 2:
  CTGTCGCTGCACG
  TGCCGTG
  
## sequence pair 3:
  CAGCACTTGGATTCTCGG
  CAGCGTGG

## Results and conclusion:

  \  | Global Alignment | Semi-Global Alignment | Local Alignment  
--- | --- | --- | ---
`sequence pair 1` | 77 | 97 | 106
`sequence pair 2` | -4 | 21 | 21
`sequence pair 3` | -10 | 21 | 21

## Alignment G1:

T`GG`-`T`--`A`G`ATTC`-`C`--`CACGAGATCTACCGAG`-`TATGAGTAGG`GGG`AC`-`G`TT`CGCT`-`CGG`-

-`GC`C`T`CT`A`-`ACAC`A`C`TG`CACGAGATCAACCGAG`A`TATGAGTAAT`---`AC`A`G`--`CGGT`A`CGG`G

## Alignment G2:

C`TGTCG`C`TG`CACG

-`TGCCG`-`TG`----

## Alignment G3:

`CAGC`ACTT`G`GA`T`TCTC`GG`

`CAGC`----`G`--`T`----`GG`

## Alignment S1:

---TGGTAGATTC-C--CACGAGATCTACCGAG-TATGAGTAGGGGGAC-GTTCGCT-CGG-

GCCTC-TA-ACACACTGCACGAGATCAACCGAGATATGAGTAAT---ACAG--CGGTACGGG

## Alignment S2:

C`TGTCG`C`TG`GCAC

-`TGCCG`-`TG`----

## Alignment S3:

CAGCACTTGGGGCTCTTA

CAGCG-T-GG--------

## Alignment L1:

CACGAGATCTACCGAG-TATGAGTA

CACGAGATCAACCGAGATATGAGTA

## Alignment L2:

TGTCGCTG

TGCCG-TG

## Alignment L3:

CAGCACTTGG

CAGCG-T-GG

# Notes on these results: 

⋅⋅* Semi Global Alignment is always better than Global Alignment.

⋅⋅* Local Alignment is always better than the Global Alignment and maybe equal to the scores in the semi global Alignment.

⋅⋅* The semi-global alignment algorithm was able to detect better than the global alignment algorithm.

⋅⋅* The local alignment algorithm was able to detect region(s) of similarity that were overlooked by the global alignment.
