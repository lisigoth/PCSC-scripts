node: IP*
copy_corpus: t

query: (IP* iDomsMod NP-SBJ|PRO It|Itt|It_|it|itt|it?|it_|_it|jt|IT|jt)
   AND ({1}NP-SBJ HasSister IP-INF*)
   AND (NP-SBJ hasSister B*)
   AND (NP-SBJ hasSister !V*)
   AND (B* iPrecedes !IP-INF)

append_label{1}: -index
