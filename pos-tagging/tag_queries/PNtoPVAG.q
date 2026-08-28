node: $METAROOT
copy_corpus: T
define: Defs.def
ignore_nodes: ADV|NEG

query:
(P iPrecedes {1}[1]N) AND
([1]N iDoms *ing|*yng|i*n%g)
replace_label{1}: VAG
