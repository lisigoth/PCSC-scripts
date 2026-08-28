node: $METAROOT
copy_corpus: T

query: ({1}ADJP iprecedes {2}NP) AND (ADJP hassister NP) AND (NP iDoms !PRO)

extend_span{2,1}:
