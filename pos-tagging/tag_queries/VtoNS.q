node: $METAROOT
copy_corpus: T
ignore_nodes: ADJ|ERROR
define: Defs.def

query:
((preN iPrecedes {1}[1]V*|ERROR) AND ([1]V*|ERROR iDoms *es|*is)) OR
((preN iPrecedes [2]ERROR) AND ([2]ERROR iDoms *es|*is|*is%))
replace_label{1}: NS
