node: $METAROOT
copy_corpus: T
define: Defs.def
ignore_nodes: NEG|RP|ADV*

query: ({1}VP iprecedes {2}V*|D*|H*|B*) AND (VP hassister V*|D*|H*|B*)

extend_span{1,2}:
