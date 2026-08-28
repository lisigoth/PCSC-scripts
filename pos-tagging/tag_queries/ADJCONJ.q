node: $METAROOT
copy_corpus: T
ignore_nodes: ADV*|PUNC
define: Defs.def

query:
({1}ERROR iPrecedes [1]CONJ) AND ([1]CONJ iPrecedes ADJ)
replace_label{1}: ADJ
