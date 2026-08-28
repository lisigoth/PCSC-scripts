node: $METAROOT
copy_corpus: T

query: ({1}[1]NPR iprecedes {2}[2]NPR) AND ([1]NPR hassister [2]NPR) AND ([1]NPR iDoms Sir)

add_internal_node{1,2}: NP
