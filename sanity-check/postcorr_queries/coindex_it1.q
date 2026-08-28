node: IP*
copy_corpus: t

query: (IP* iDomsMod NP-SBJ|PRO It|Itt|It_|it|itt|it?|it_|_it|jt|IT|jt)
   AND ({1}NP-SBJ HasSister CP-QUE-SUB*|CP-THT*|IP-INF*)

append_label{1}: -index
