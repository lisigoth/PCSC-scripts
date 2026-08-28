node: $METAROOT
copy_corpus: T
ignore_nodes: ADV|NEG

query: (TO|MD|DO*|EX iPrecedes {1}[1]P) AND ([1]P iDoms be|_be)
replace_label{1}: BE
