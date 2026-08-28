node: $METAROOT
copy_corpus: T
ignore_nodes: ADV*|PUNC
define: Defs.def

query:
([1]CONJ iPrecedes {1}ERROR) AND (ADJ iPrecedes [1]CONJ)
replace_label{1}: ADJ
