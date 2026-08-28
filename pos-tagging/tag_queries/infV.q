node: $METAROOT
copy_corpus: T
ignore_nodes: ADV|NEG

query: (TO|MD|VBP|DOD|DOP iPrecedes {1}VB*) OR (TO|MD|VBP|DOD|DOP iPrecedes ERROR)
replace_label{1}: VB
