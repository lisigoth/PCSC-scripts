node: $METAROOT
copy_corpus: T
define: Defs.def

query: ({1}IP* idoms [1]finV) AND ([1]finV hassister [2]finV)

append_label{1}: -FIX
