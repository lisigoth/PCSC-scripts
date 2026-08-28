#!/bin/bash
CS="java -cp /Applications/CS_2.003.04.jar csearch.CorpusSearch"

for file in m1600_3.tag.out
do
BASE=`basename $file .tag.out`
cp -f $file working/$BASE.pos

#TO THAT = TO D
$CS tag_queries/TOTHAT.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# TO -> P
$CS tag_queries/TO-P.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# TO/MD + V -> V = VB
$CS tag_queries/infV.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# TO/MD + HV* -> HV* = HV
$CS tag_queries/infHV.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# TO/MD + DO* -> DO* = DO
$CS tag_queries/infDO.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# TO + be -> be = BE
$CS tag_queries/be-BE.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# HV* + VBD -> VBD = VBN
$CS tag_queries/VBN.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# BE* + VBD -> VBD = VAN
$CS tag_queries/VAN.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# BE* + ERROR -> ADJ
$CS tag_queries/BEADJ.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# VAG = ADJ
$CS tag_queries/VAGtoADJ.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# V = NS
$CS tag_queries/VtoNS.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# V = N
$CS tag_queries/VtoN.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos
#will capture things like 'THIS V'. Solution?

# VBN/D = N
$CS tag_queries/VBNorDtoADJ.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos
#will capture things like 'THIS V'. Solution?

# Detc _s N = N$
$CS tag_queries/makeposN.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# Detc _ N = ADJ
$CS tag_queries/makeADJ.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# Detc _ = N
$CS tag_queries/makeN.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# ADV = ADJ
$CS tag_queries/ADVtoADJ.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# ADV so ADV -> ADVR ADV
$CS tag_queries/ADVtoADVR.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# N = NS
$CS tag_queries/NtoNs.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# PRO ye + N -> PRO = D
$CS tag_queries/ye-D.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# TO -> P again
$CS tag_queries/TO-P.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# (C as) -> P
$CS tag_queries/asisP.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# P ERROR = P N
$CS tag_queries/PcompisN.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# P V = P N
$CS tag_queries/PcompisN2.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# D VAG = D N
$CS tag_queries/VAGtoN.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# N = NS again
$CS tag_queries/NtoNs.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# P Ning = P VAG
$CS tag_queries/PNtoPVAG.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# PRO$ Ning = PRO$ VAG
$CS tag_queries/NingtoVAG2.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos
#includes king....

# PRO|N N NEG -> N=VBP
$CS tag_queries/NNEGtoVNEG.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# ADJ CONJ ERROR -> ADJ CONJ ADJ and vice versa
$CS tag_queries/CONJADJ.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# ADJ CONJ ERROR -> ADJ CONJ ADJ and vice versa
$CS tag_queries/ADJCONJ.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# N CONJ ERROR -> N CONJ N and vice versa
$CS tag_queries/NCONJ.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

# N CONJ ERROR -> N CONJ N and vice versa
$CS tag_queries/CONJN.q working/$BASE.pos
mv -f working/$BASE.pos.out working/$BASE.pos

mv -f working/$BASE.pos $BASE.pos

done
