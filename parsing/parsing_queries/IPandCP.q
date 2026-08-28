node: $METAROOT
copy_corpus: T

query: ({1}IP* iPrecedes {2}CP) AND (IP* hassister CP)

extend_span{1,2}:
