node: $METAROOT
copy_corpus: T
ignore_nodes: ADJ
define: Defs.def

query: ({1}[1]TO iPrecedes preN|N*|PRO*)
replace_label{1}: P
