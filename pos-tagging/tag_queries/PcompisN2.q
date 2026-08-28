node: $METAROOT
copy_corpus: T
ignore_nodes: D|Q|PRO$|N$|ADJ

query: (P iPrecedes {1}VB*|VAN)
replace_label{1}: N
