node: $METAROOT
copy_corpus: T

query: (IP-MAT iDoms {1}N|NS|N-Z*|NS-Z*|NPR|NPRS|PRO|PRO+N|NUM)

add_internal_node{1,1}: NP
