node: $METAROOT
copy_corpus: T
define: Defs.def
ignore_nodes: PUNC|CONJ

query: ({1}[1]NP iprecedes {2}[2]NP) AND ([NP hassister NP) AND ([2]NP iprecedes !VP)

extend_span{1,2}:
