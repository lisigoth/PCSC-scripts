node: CONJP*

copy_corpus: t

query: ([1]CONJP* iDoms [2]{1}CONJP|IP*[-=]PRN-*)

prepend_label{1}: ZZZ-
