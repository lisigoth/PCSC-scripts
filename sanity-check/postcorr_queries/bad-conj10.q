node: $ROOT

copy_corpus: t

define: EME.def

query: ([1]{1}NP*|WNP* iDoms [2]preN)
   AND ([2]preN hasSister [3]noun)
   AND ([3]noun iPrecedes CONJ)
   AND ([1]NP*|WNP* Doms CONJ)
   AND (CONJ iPrecedes [4]preN)
   AND (CONJ hasSister [4]preN)
   AND ([4]preN hasSister [5]noun)
   AND (CONJ iPrecedes !NX|NP)

prepend_label{1}: ZZZ-
