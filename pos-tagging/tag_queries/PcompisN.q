node: $METAROOT
copy_corpus: T
ignore_nodes: D|Q|PRO$|N$|ADJ

query: (P|OTHER iPrecedes {1}ERROR)
replace_label{1}: N
