node: $METAROOT
define: Defs.def

copy_corpus: t

query: (IP-INF-inf* idoms {1}VB)

add_leaf_before{1}: (TO star)
