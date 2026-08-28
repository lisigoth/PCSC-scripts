node: $METAROOT
copy_corpus: T

query: ({1}[1]ADVP iprecedes {2}IP*) OR (IP* iprecedes [2]ADVP) AND (ADVP hassister IP*)

extend_span{2,1}:
