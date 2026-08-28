node: $METAROOT
copy_corpus: T
define: Defs.def

query: ({1}IP* idoms !NP-SBJ*|NP-Z) AND (IP* idoms finV)

append_label{1}: -noSBJ
