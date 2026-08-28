node: $METAROOT
copy_corpus: T
ignore_nodes: ADJ
define: Defs.def

query: (preN iPrecedes {1}ERROR)
replace_label{1}: N
