node: $METAROOT
copy_corpus: T

query: (NP* idoms {1}Q) AND (NP* idoms N|NS|PRO|PRO$|ADJ|OTHER|SUCH|D) AND (Q iprecedes !N|NS|PRO|PRO$|ADJ|OTHER|SUCH|D)

add_internal_node{1}: QP-ZZ
