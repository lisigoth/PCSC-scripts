node: $METAROOT
copy_corpus: T
define: Defs.def

query: ({1}VP iprecedes {2}PP) AND (VP hassister PP)

extend_span{1,2}:
