node: ADVP*|WADVP*

add_to_ignore: \**
define: EME.def
copy_corpus: t

query: ({1}ADVP*|WADVP* iDoms CONJ)
   AND (ADVP*|WADVP* iDoms !CONJP)
   AND (ADVP*|WADVP* iDoms preAdv)
   AND (preAdv iPrecedes adverb)
   AND (preAdv hasSister adverb)
//   AND (ADVP*|WADVP* iDoms adverb)

prepend_label{1}: ZZZ-
