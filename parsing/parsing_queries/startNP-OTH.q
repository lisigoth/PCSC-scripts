node: $METAROOT
copy_corpus: T
define: Defs.def

query: (IP-MAT iDoms OTHER) AND (preN iPrecedes {1}OTHER) AND (preN hassister OTHER) AND (OTHER iPrecedes !N*)

add_internal_node{1,1}: NP-ZY
