node: $METAROOT
copy_corpus: T

query: ({1}ADJ iPrecedes {2}NP) AND (ADJ hassister NP) AND (NP iDoms !PRO)

extend_span{2,1}:
