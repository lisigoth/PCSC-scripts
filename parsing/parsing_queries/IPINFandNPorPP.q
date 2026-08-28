node: $METAROOT
copy_corpus: T
ignore_nodes: ADV*|RP

query: ({1}IP-INF iprecedes {2}NP|PP) AND (IP-INF hassister NP|PP)

extend_span{1,2}:
