node: $METAROOT
copy_corpus: T
ignore_nodes: ADV*|RP

query: ({1}PP iprecedes {2}IP-PPL) AND (PP hassister IP-PPL) AND (PP idomsonly P)

extend_span{1,2}:
