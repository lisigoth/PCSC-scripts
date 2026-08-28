node: $METAROOT
copy_corpus: T
define: Defs.def

query: (IP-MAT iDoms {1}finV) AND (!CONJ iprecedes finV)

add_internal_node{1,1}: VP
