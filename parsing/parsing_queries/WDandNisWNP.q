node: $METAROOT
copy_corpus: T

query: ({1}WD|WPRO$ iPrecedes {2}N)
   AND (WD hasSister N)

add_internal_node{1, 2}: WNP
