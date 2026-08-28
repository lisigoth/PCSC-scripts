node: $METAROOT
copy_corpus: T
define: Defs.def

query: ({1}VP iprecedes {2}NP|PP|ADJP|NP-*) AND (VP hassister NP|PP|ADJP|NP-*)

extend_span{1,2}:
