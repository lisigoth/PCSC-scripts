node: $METAROOT
copy_corpus: T

query: ({1}CP-REL iprecedes {2}V*|H*|MD*) AND (CP-REL hassister V*|B*|H*|MD*)

extend_span{1,2}:
