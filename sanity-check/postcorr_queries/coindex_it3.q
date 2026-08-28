node: IP*
copy_corpus: t

query: (IP* iDomsMod NP-SBJ|PRO It|Itt|It_|it|itt|it?|it_|_it|jt|IT|jt)
   AND ([1]{1}NP-SBJ HasSister IP-INF*)
   AND (IP-INF idoms ![2]NP-SBJ*)
   AND ([1]NP-SBJ hasSister V*)

prepend_label{1}: -index
