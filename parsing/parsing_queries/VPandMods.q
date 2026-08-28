node: $METAROOT
copy_corpus: T
define: Defs.def

query: ({1}VP iprecedes {2}[1]ADVP|NEG|FP|ALSO) OR ([2]ADVP|NEG|FP|ALSO iprecedes VP) AND (ADVP|NEG|FP|ALSO hassister VP)

extend_span{1,2}:
