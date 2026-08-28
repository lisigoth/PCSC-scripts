node: $METAROOT
copy_corpus: T
define: Defs.def

query: (IP-MAT iDoms ADJ) AND (preN iPrecedes {1}ADJ) AND (preN hassister ADJ)

add_internal_node{1,1}: NP-ZZ
