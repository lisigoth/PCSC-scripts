node: $METAROOT
copy_corpus: T
ignore_nodes: ADV|NEG

query: (TO|MD iPrecedes {1}HV*)
replace_label{1}: HV
