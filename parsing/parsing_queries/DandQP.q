node: $METAROOT
copy_corpus: T
define: Defs.def
ignore_nodes: ADV|ADVR|QR

query: ({1}preN iprecedes {2}QP) AND (preN hassister QP)

extend_span{2,1}:
