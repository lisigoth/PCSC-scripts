node: $METAROOT
copy_corpus: T
ignore_nodes: ADJ

query: ({1}[1]PRO iPrecedes N*|AD*|WPRO|Q*) AND ([1]PRO iDoms ye|y=e=)
replace_label{1}: D
