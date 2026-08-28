node: $METAROOT
copy_corpus: T
define: Defs.def

query: ({1}NP|EX|QP iprecedes {2}VP) AND (NP|EX|QP hassister VP)

extend_span{2,1}:
