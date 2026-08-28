node: $METAROOT
copy_corpus: T

query: ({1}IP* iprecedes {2}NP) AND (IP* hassister NP)

extend_span{1,2}:
