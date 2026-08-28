node: $ROOT

copy_corpus: t

define: EME.def

query: ([1]{1}ADJP*|WADJP* iDoms [2]preAdj)
   AND ([2]preAdj hasSister [3]adjective)
   AND ([3]adjective iPrecedes CONJ)
   AND ([3]adjective hasSister CONJ)
   AND (CONJ iPrecedes [4]preAdj)
   AND (CONJ iPrecedes !ADJX)

prepend_label{1}: ZZZ-
