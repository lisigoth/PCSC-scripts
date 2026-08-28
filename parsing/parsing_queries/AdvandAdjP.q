node: $METAROOT
copy_corpus: T

query: ({1}ADV* iprecedes {2}ADJP) AND (ADV* hassister ADJP)

extend_span{2,1}:
