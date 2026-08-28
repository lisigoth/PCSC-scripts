node: $METAROOT
copy_corpus: T
define: Defs.def

query: ({1}PP iprecedes {2}NP|NP-*|preN) AND (PP hassister NP|NP-*|preN)

extend_span{1,2}:
