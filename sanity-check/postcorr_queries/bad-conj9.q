node: $ROOT

copy_corpus: t

define: EME.def

query: ([1]{1}ADVP*|WADVP* iDoms [2]preAdv)
   AND ([2]preAdv hasSister [3]adverb)
   AND ([3]adverb iPrecedes CONJ)
   AND ([3]adverb hasSister CONJ)
   AND (CONJ iPrecedes [4]preAdv)
   AND (CONJ iPrecedes !ADVX)

prepend_label{1}: ZZZ-
