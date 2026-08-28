node: $METAROOT
copy_corpus: T
define: Defs.def

query: ({1}ADVP iprecedes {2}VP) AND (ADVP hassister VP)

extend_span{2,1}:
