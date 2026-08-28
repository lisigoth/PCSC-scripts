node: $ROOT

copy_corpus: t

define: EME.def

query: ([1]AD[JV]P*|[NP]P*|WAD[JV]P*|W[NP]P* iDomsFirst [2]{1}AD[JV]P*|[NP]P*|WAD[JV]P*|W[NP]P*)
   AND ([1]AD[JV]P*|[NP]P*|WAD[JV]P*|W[NP]P* iDomsMod CONJP AD[JV]X|NX|W*X)
   AND ([1]AD[JV]P*|[NP]P*|WAD[JV]P*|W[NP]P* iDoms !NPR*|NP-POS|NP-MSR|NP-PRN)
   AND ([1]AD[JV]P*|[NP]P*|WAD[JV]P*|W[NP]P* iPrecedes !noun)

prepend_label{1}: ZZZ-
