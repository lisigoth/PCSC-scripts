node: $METAROOT
copy_corpus: T
ignore_nodes: ADV*
define: Defs.def

query:
(preN iPrecedes {1}[1]ERROR) AND
([1]ERROR iPrecedes N*) AND
([1]ERROR iDoms *s)
replace_label{1}: N$
