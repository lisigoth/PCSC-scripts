node: $METAROOT
copy_corpus: T
ignore_nodes: ADV|NEG

query: (TO|MD iPrecedes {1}DO*)
replace_label{1}: DO
