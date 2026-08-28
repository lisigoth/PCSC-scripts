node: $METAROOT
copy_corpus: T

query:  ({2}NP|ONE|QP iprecedes {1}PP) AND (PP iDomsMod P of|off)

extend_span{2,1}:
