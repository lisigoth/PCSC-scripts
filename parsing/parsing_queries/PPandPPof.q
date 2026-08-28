node: $METAROOT
copy_corpus: T

query:  ({2}[1]PP iprecedes {1}[2]PP) AND ([1]PP HasSister [2]PP) AND ([2]PP iDomsMod P of|off)

extend_span{2,1}:
