node: $METAROOT
copy_corpus: T
ignore_nodes: ADV|NEG|PRO

query: (HV* iPrecedes {1}V*) OR (HV* iPrecedes ERROR)
replace_label{1}: VBN
