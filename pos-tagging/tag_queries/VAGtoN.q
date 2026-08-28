node: $METAROOT
copy_corpus: T
define: Defs.def
ignore_nodes: ADJ

query: (preN iPrecedes {1}[1]VAG)
replace_label{1}: N
