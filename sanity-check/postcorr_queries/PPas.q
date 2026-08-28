node: $METAROOT
copy_corpus: T

query: (IP* iDoms {1}NP) AND (NP iDoms PP) AND (PP iDoms \as)

append_label{1}: -Pas
