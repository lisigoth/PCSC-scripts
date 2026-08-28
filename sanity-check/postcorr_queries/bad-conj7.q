node: RRC*

copy_corpus: t

query: ([1]RRC* iDoms {1}CONJP)
   AND (CONJP iDoms ![2]RRC*=*)
   AND ([1]RRC* iDoms !RRC*)

prepend_label{1}: ZZZ-
