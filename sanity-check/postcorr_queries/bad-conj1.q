node: AD[JV]P*|[NPQ]P*|WAD[JV]P*|W[NQP]P*

copy_corpus: t

ignore_nodes: \**

query: ([1]AD[JV]P*|[NPQ]P*|WAD[JV]P*|W[NQP]P* domsWords 3)
   AND ([1]AD[JV]P*|[NPQ]P*|WAD[JV]P*|W[NQP]P* iDoms CONJ)
   AND ([1]AD[JV]P*|[NPQ]P*|WAD[JV]P*|W[NQP]P* iDoms [2]{1}CONJP|AD[JV]P*|AD[JV]X|NP|NP-*|[PQ]P*|[NPQ]X|WAD[JV]P*|WAD[JV]X|W[NQP]P*|W[NQP]X)
   AND ([1]AD[JV]P*|[NPQ]P*|WAD[JV]P*|W[NQP]P* iDomsFirst !CONJ)

prepend_label{1}: ZZZ-
