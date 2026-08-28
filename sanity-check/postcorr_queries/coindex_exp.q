node: IP*
copy_corpus: t

query: ({1}NP-SBJ iDoms \*exp\*)
   AND (NP-SBJ HasSister CP-QUE|CP-THT|IP-INF)

append_label{1}: -index
