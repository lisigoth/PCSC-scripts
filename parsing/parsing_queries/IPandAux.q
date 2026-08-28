node: $METAROOT
copy_corpus: T

query: ({1}B*|H*|MD iprecedes {2}IP*) AND (B*|H*|MD hassister IP*)

extend_span{2,1}:
