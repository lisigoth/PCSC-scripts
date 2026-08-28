node: NP*|WNP*
define: Defs.def
add_to_ignore: \**

copy_corpus: t

query: ({1}NP*|WNP* domsWords> 3)
   AND (NP*|WNP* iDoms CONJ)
   AND (NP*|WNP* iDoms !CONJP)
   AND (preN precedes noun)

prepend_label{1}: ZZZ-
