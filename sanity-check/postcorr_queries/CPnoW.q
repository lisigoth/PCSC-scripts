node: $METAROOT
copy_corpus: T

query: ({1}CP-ADV*|CP-CMP*|CP-REL*|CP-EOP* iDoms IP-SUB*) AND ((CP-ADV*|CP-CMP*|CP-REL*|CP-EOP* iDoms C) AND (C idoms \0)) AND (CP-ADV*|CP-CMP*|CP-REL*|CP-EOP* iDoms !W*)

append_label{1}: -noW
