node: $METAROOT
copy_corpus: T
ignore_nodes: ADV*|ALSO

query: ({1}IP-INF iprecedes {2}VB|BE|DO|HV) AND (IP-INF hassister VB|BE|DO|HV)

extend_span{1,2}:
