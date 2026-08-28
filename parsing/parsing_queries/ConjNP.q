node: $METAROOT
copy_corpus: T

query: (CONJ iprecedes {1}[1]N*) AND ({2}[2]N* iprecedes CONJ) AND ([1]N* hassister [2]N*)

add_internal_node{1,2}: NP
