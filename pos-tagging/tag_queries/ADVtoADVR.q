node: $METAROOT
copy_corpus: T

query: ({1}[1]ADV iPrecedes ADJ|ADV) AND ([1]ADV iDoms so|soe)
replace_label{1}: ADVR
