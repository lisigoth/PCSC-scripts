node: $METAROOT
copy_corpus: T
define: Defs.def

query: (IP* iDoms {1}V*) AND (V* idoms pray)

append_label{1}: -pray
