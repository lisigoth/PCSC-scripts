node: $METAROOT
copy_corpus: T
ignore_nodes: ADV|NEG

query:
(B* iPrecedes {1}ERROR)
replace_label{1}: ADJ
