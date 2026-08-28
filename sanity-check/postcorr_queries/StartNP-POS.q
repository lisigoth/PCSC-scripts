node: $METAROOT
copy_corpus: T
define: Defs.def

query: (NP iDoms {1}N$|NS$|PRO$) AND (({2}preN iprecedes N$|NS$|PRO$) AND (preN hassister N$|NS$|PRO$))

add_internal_node{1,2}: NP-POS
