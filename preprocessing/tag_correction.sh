#!/bin/bash
CS="java -cp /Applications/CS_2.003.04.jar csearch.CorpusSearch"

for file in Sarah/CORR_ERRORS/1195_90_m1650.tag
do
BASE=`basename $file .tag`
cp -f $file Working/$BASE.pos

#TO THAT = TO D
$CS tag_queries/TOTHAT.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# TO -> P
$CS tag_queries/TO-P.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# TO/MD + V -> V = VB
$CS tag_queries/infV.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# TO/MD + HV* -> HV* = HV
$CS tag_queries/infHV.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# TO/MD + DO* -> DO* = DO
$CS tag_queries/infDO.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# TO + be -> be = BE
$CS tag_queries/be-BE.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# HV* + VBD -> VBD = VBN
$CS tag_queries/VBN.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# BE* + VBD -> VBD = VAN
$CS tag_queries/VAN.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# BE* + ERROR -> ADJ
$CS tag_queries/BEADJ.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# VAG = ADJ
$CS tag_queries/VAGtoADJ.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# V = NS
$CS tag_queries/VtoNS.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# V = N
$CS tag_queries/VtoN.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos
#will capture things like 'THIS V'. Solution?

# VBN/D = N
$CS tag_queries/VBNorDtoADJ.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos
#will capture things like 'THIS V'. Solution?

# Detc _s N = N$
$CS tag_queries/makeposN.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# Detc _ N = ADJ
$CS tag_queries/makeADJ.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# Detc _ = N
$CS tag_queries/makeN.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# ADV = ADJ
$CS tag_queries/ADVtoADJ.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# ADV so ADV -> ADVR ADV
$CS tag_queries/ADVtoADVR.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# N = NS
$CS tag_queries/NtoNs.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# PRO ye + N -> PRO = D
$CS tag_queries/ye-D.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# TO -> P again
$CS tag_queries/TO-P.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# (C as) -> P
$CS tag_queries/asisP.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# P ERROR = P N
$CS tag_queries/PcompisN.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# P V = P N
$CS tag_queries/PcompisN2.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# N = NS again
$CS tag_queries/NtoNs.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# P Ning = P VAG
$CS tag_queries/PNtoPVAG.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# PRO$ Ning = PRO$ VAG
$CS tag_queries/NingtoVAG2.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos
#includes king....

# PRO|N N NEG -> N=VBP
$CS tag_queries/NNEGtoVNEG.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# ADJ CONJ ERROR -> ADJ CONJ ADJ and vice versa
$CS tag_queries/CONJADJ.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# ADJ CONJ ERROR -> ADJ CONJ ADJ and vice versa
$CS tag_queries/ADJCONJ.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# N CONJ ERROR -> N CONJ N and vice versa
$CS tag_queries/NCONJ.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

# N CONJ ERROR -> N CONJ N and vice versa
$CS tag_queries/CONJN.q Working/$BASE.pos
mv -f Working/$BASE.pos.out Working/$BASE.pos

mv -f Working/$BASE.pos Sarah/autocorrect/$BASE.pos

done
