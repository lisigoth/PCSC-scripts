node: $METAROOT
copy_corpus: T
ignore_nodes: ADV

query: ({1}[1]VAG iPrecedes N*) AND (D|Q|PRO$|N$ iPrecedes [1]VAG)
replace_label{1}: ADJ
