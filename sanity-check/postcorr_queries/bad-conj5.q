node: IP*

copy_corpus: t

query: ([1]IP* iDoms {1}CONJP)
   AND (CONJP iDoms ![2]IP*=*)
   AND ([1]IP* iDoms !IP*|ip*)

prepend_label{1}: ZZZ-
