node: $METAROOT
copy_corpus: T
define: Defs.def
ignore_nodes: PUNC

query: ({1}preN iprecedes {2}NP*) AND (preN hassister NP*) AND (NP* iDoms OTHER)

extend_span{2,1}:
