node: $METAROOT
copy_corpus: T

query: (CONJ iprecedes {1}[1]V*) AND ({2}[2]V* iprecedes CONJ) AND ([1]V* hassister [2]V*)

add_internal_node{1,2}: V
