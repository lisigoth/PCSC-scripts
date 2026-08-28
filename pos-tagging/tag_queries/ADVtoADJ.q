node: $METAROOT
copy_corpus: T
ignore_nodes: ADV

query: ({1}[1]ADV iPrecedes N*|WPRO|Q*) AND (D iPrecedes [1]ADV)
replace_label{1}: ADJ
