node: $METAROOT
copy_corpus: T
ignore_nodes: ADV|NEG

query:
(B* iPrecedes {1}VB*) OR
((B* iPrecedes ERROR) AND (ERROR iDoms *t|*d|*en|*\in|*ine))
replace_label{1}: VAN
