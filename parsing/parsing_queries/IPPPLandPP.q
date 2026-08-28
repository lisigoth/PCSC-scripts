node: $METAROOT
copy_corpus: T
ignore_nodes: ADV*|RP

query: ({1}IP-PPL iprecedes {2}PP) AND (IP-PPL hassister PP)

extend_span{1,2}:
