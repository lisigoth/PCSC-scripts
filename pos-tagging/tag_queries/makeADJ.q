node: $METAROOT
copy_corpus: T
ignore_nodes: ADV*|ADJ
define: Defs.def

query: (preN|P|ADVR iPrecedes {1}[1]ERROR) AND ([1]ERROR iPrecedes N|NS)
replace_label{1}: ADJ
