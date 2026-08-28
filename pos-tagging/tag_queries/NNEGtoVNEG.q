node: $METAROOT
copy_corpus: T
define: Defs.def
ignore_nodes: preN

query:
((PRO|N|NS|NPR|NPRS iPrecedes {1}[1]N) AND ([1]N iPrecedes NEG)) OR
((PRO|N|NS|NPR|NPRS iPrecedes [2]ERROR) AND ([2]ERROR iPrecedes NEG))
replace_label{1}: VBP
