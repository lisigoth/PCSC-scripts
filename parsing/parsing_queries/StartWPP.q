node: $METAROOT
copy_corpus: T

query: ({1}P iPrecedes {2}WNP) AND (P hassister WNP)

add_internal_node{1,2}: WPP
