node: ADJP*|WADJP*

add_to_ignore: \**
define: EME.def
copy_corpus: t

query: ({1}ADJP*|WADJP* iDoms CONJ)
   AND (ADJP*|WADJP* iDoms !CONJP)
   AND (ADJP*|WADJP* iDoms preAdj)
   AND (preAdv iPrecedes adjective)
   AND (preAdv hasSister adjective)
//   AND (ADJP*|WADJP* iDoms adjective)

prepend_label{1}: ZZZ-
