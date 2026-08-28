node: $METAROOT
copy_corpus: T

query: ({1}ADJP|ADVP|FP|PP|QP|NP|EX hasSister {2}IP)
   AND (ADJP|ADVP|FP|PP|QP|NP|EX iPrecedes IP)

extend_span{2,1}:
