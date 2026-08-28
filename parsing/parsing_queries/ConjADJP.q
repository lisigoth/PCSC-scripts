node: $METAROOT
copy_corpus: T

query: (CONJ iprecedes {1}[1]ADJ*) AND ({2}[2]ADJ* iprecedes CONJ) AND ([1]ADJ* hassister [2]ADJ*)

add_internal_node{1,2}: ADJP
