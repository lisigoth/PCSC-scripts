node: $METAROOT
copy_corpus: T
define: Defs.def
ignore_nodes: ADV|NEG

query:
(PRO$ iPrecedes {1}[1]N) AND
([1]N iDoms *ing|*yng)
replace_label{1}: VAG
