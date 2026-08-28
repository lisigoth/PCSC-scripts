node: NP*|WNP*
define: Defs.def
add_to_ignore: \**

copy_corpus: t

query: (WNP* idomsonly {1}WD)

replace_label{1}: WPRO
