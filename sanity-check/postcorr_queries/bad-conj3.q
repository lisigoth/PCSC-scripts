node: IP*

copy_corpus: t

query: ([1]{1}AD[JV]P*|[NPQ]P*|WAD[JV]P*|W[NPQ]P* iDoms CONJP)
   AND (CONJP iDoms [2]AD[JV]P|[NPQ]P|WAD[JV]P|W[NPQ]P)
   AND ([1]AD[JV]P*|[NPQ]P*|WAD[JV]P*|W[NPQ]P* iDoms ![3]AD[JV]P|[NPQ]P|WAD[JV]P*|W[NPQ]P*)

prepend_label{1}: ZZZ-
