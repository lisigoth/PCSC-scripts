node: $METAROOT
copy_corpus: T
ignore_nodes: RP|PUNC|ADV*|ALSO

query: ({1}[1]ERROR iPrecedes NP|C|TO) AND (NP|MD|DOP|DOD|EX iPrecedes [1]ERROR)
replace_label{1}: VB-ZZs
