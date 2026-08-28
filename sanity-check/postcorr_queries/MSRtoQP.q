node: $METAROOT
copy_corpus: T

query: (NP*|ADJP*|ADVP*|NUMP* idoms {1}NP-MSR)

append_label{1}: -Q
