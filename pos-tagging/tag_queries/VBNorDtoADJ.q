node: $METAROOT
copy_corpus: T
ignore_nodes: ADJ|ERROR
define: Defs.def

query: (preN|P iPrecedes {1}VBD|VBN|VAN)
replace_label{1}: ADJ
