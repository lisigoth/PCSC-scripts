node: $METAROOT
copy_corpus: T

query: ({1}CONJP iprecedes {2}IP*) AND (CONJP hassister IP*)

extend_span{1,2}:
