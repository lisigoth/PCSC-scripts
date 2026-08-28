node: $METAROOT
copy_corpus: T
ignore_nodes: ADJ

query:
({1}N iDoms *is|*is%)
replace_label{1}: NS
