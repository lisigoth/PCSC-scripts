node: $METAROOT
copy_corpus: T
define: Defs.def

query: ({1}PP iprecedes {2}ADVP) AND (PP hassister ADVP)

extend_span{1,2}:
