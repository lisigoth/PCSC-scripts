node: $METAROOT
copy_corpus: T

query: ({1}IP* iprecedes {2}PP) AND (IP* hassister PP)

extend_span{1,2}:
