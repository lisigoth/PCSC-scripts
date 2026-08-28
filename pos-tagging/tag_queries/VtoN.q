node: $METAROOT
copy_corpus: T
ignore_nodes: ADJ|ERROR
define: Defs.def

query: (preN iPrecedes {1}VB|VBP) OR (preN iPrecedes ERROR)
replace_label{1}: N
