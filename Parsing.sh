#!/bin/bash

CS="java -cp /Applications/CS_2.003.04.jar csearch.CorpusSearch"

for file in m1600s.pos
do
BASE=`basename $file .pos`
cp -f $file working/$BASE.psd

#ERROR corrections

# ERRORet -> _ = VBD
$CS parsing_queries/makeVBD.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd


#Make NPs, NUMPs, and WNPs

# NPR + NPR = NP
$CS parsing_queries/NPRandNPR.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd
#
# # NP Conj NP = NP
# $CS parsing_queries/ConjNP.q working/$BASE.psd
# mv -f working/$BASE.psd.out working/$BASE.psd
#
# # Adj Conj Adj = ADJP
# $CS parsing_queries/ConjADJP.q working/$BASE.psd
# mv -f working/$BASE.psd.out working/$BASE.psd
#
# # V* Conj V* = V
# $CS parsing_queries/ConjV.q working/$BASE.psd
# mv -f working/$BASE.psd.out working/$BASE.psd
#
# # CONJ = CONJP
# $CS parsing_queries/StartConjP.q working/$BASE.psd
# mv -f working/$BASE.psd.out working/$BASE.psd
#
#WD + N = WNP
$CS parsing_queries/WDandNisWNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# WPRO = WNP
$CS parsing_queries/StartWNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#WD + D = WNP
$CS parsing_queries/WDandD.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# NUM = NUMP
$CS parsing_queries/StartNUMP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd
#
# N|NS|NPR|NPRS = NP
$CS parsing_queries/StartNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#Make ADJPs and (W)ADVPs and include them in NP

# ADJ + NP = NP
$CS parsing_queries/AdjandNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# D + ADJ = (NP ADJ)
$CS parsing_queries/startNP-ADJ.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# D + (NP ADJ) = (NP D ADJ)
$CS parsing_queries/DandADJ-NP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# ADJ = ADJP
$CS parsing_queries/StartAdjP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# AdvP + AdjP -> (AdjP Adv X)
$CS parsing_queries/AdvandAdjP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# ADV = ADVP
$CS parsing_queries/StartAdvP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# WADV = WADVP
$CS parsing_queries/StartWAdvP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# AdjP (NP) -> (NP (AdjP) N)
$CS parsing_queries/AdjPandNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#Make OTHER NPs

# D + OTHER = (NP OTHER)
$CS parsing_queries/StartNP-OTH.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# D + (NP OTHER) = (NP D OTHER)
$CS parsing_queries/DandNP-OTH.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#Expand NPs

# D (NP X) -> (NP D X)
$CS parsing_queries/DandNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# D (NP X) -> (NP D X)
$CS parsing_queries/DandNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# D (NP X) -> (NP D X)
$CS parsing_queries/DandNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# D (NP X) -> (NP D X)
$CS parsing_queries/DandNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#start QP

# Q=QP
$CS parsing_queries/startQP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# D + (QP Q) = (QP D Q)
$CS parsing_queries/DandQP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#make verbs from ERROR

#NP ERROR NP -> ERROR = VB-ZZ
$CS parsing_queries/makeVB-ZZ.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd


#Final NP errors, make + expand NPs again, make VB-ZZ again

# NPR + _ -> _ = N
$CS parsing_queries/makeN2.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# _ + N -> _ = ADJ
$CS parsing_queries/makeADJ2.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# ERRORs = NS
$CS parsing_queries/makeNS.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#NP ERROR NP -> ERROR = VB-ZZ
$CS parsing_queries/makeVB-ZZ.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#ERROR = N
$CS parsing_queries/delERROR.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# N|NS|NPR|NPRS = NP
$CS parsing_queries/StartNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# AdjP (NP) -> (NP (AdjP) N)
$CS parsing_queries/AdjPandNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# D (NP X) -> (NP D X)
$CS parsing_queries/DandNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# D (NP X) -> (NP D X)
$CS parsing_queries/DandNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#Make PPs and WPPs

#P + WNP = WPP
$CS parsing_queries/StartWPP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# P = PP
$CS parsing_queries/StartPP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# PP+NP -> PP
$CS parsing_queries/PPandNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# PP (PP of) -> (PP (PP of))
$CS parsing_queries/PPandPPof.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# PP (PP of) -> (PP (PP of))
$CS parsing_queries/PPandPPof.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# PP (PP of) -> (PP (PP of))
$CS parsing_queries/PPandPPof.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# NP (PP of) -> (NP (PP))
$CS parsing_queries/NPandPPof.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#Make IP-INF and IP-PPL

# TO = IP-INF
$CS parsing_queries/StartIPINF.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# IP-INF + VB -> IP-INF
$CS parsing_queries/IPINFandVB.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# IP-INF + VB -> IP-INF
$CS parsing_queries/IPINFandVB.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# VAG = IP-PPL
$CS parsing_queries/StartIPPPL.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# IP-PPL + PP -> (IP-PPL (PP))
$CS parsing_queries/IPPPLandPP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd
#
# IP-PPL + PP -> (IP-PPL (PP))
$CS parsing_queries/IPPPLandPP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# IP-INF + VB -> IP-INF
$CS parsing_queries/IPINFandNPorPP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#Make VP

#finV = VP
$CS parsing_queries/StartVP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#VP+AdvP=VP
$CS parsing_queries/VPandMods.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#VP+AdvP=VP
$CS parsing_queries/VPandMods.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#VP+V*=VP
$CS parsing_queries/VPandV.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#VP+V*=VP
$CS parsing_queries/VPandV.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#VP+V*=VP
$CS parsing_queries/VPandV.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#Make CP

# W* = CP
$CS parsing_queries/StartCP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# CP doms WADV  -> add (ADV *T*)
$CS parsing_queries/CPandAdvPTrace.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# CP doms WNP  -> add (NP *T*)
$CS parsing_queries/CPandNPTrace.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# CP doms WPP  -> add (PP *T*)
$CS parsing_queries/CPandPPTrace.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# CP doms W*  -> add C 0
$CS parsing_queries/CPandCzero.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#Expand VP, and change to IP

#NP-SBJ+VP=VP
$CS parsing_queries/VPandSub.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#VP+NP-OBJ or PP = VP
$CS parsing_queries/VPandObj.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#VP+NP-OBJ or PP = VP
$CS parsing_queries/VPandObj.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#ADVP + VP -> (VP ADV)
$CS parsing_queries/VPandADVP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#VP+NP-OBJ or PP = VP
$CS parsing_queries/VPandObj.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#NP-SBJ+VP=VP
$CS parsing_queries/VPandSub.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#C+VP=VP
$CS parsing_queries/VPandC.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd
#
#VP=IP
$CS parsing_queries/VPtoIP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd


#Expand IP

#XP+IP=IP
$CS parsing_queries/XPandIP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#IP* + IP = IP
$CS parsing_queries/CPandIPsub.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#XP+IP=IP
$CS parsing_queries/XPandIP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd
#
#IP=IP-SUB
$CS parsing_queries/IPtoIPsub.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#IP-SUB + CP = IP-SUB
$CS parsing_queries/IPandCP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#CP and C = CP
$CS parsing_queries/CPandC.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#IP+IP -> embed IP
$CS parsing_queries/embedIP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#IP+IP -> embed IP
$CS parsing_queries/embedIP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#IP+IP -> embed IP
$CS parsing_queries/embedIP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#"simplify" bracketing, delete nodes

#CP + IP-SUB = CP
$CS parsing_queries/CPandIPsub.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#NP + CP = NP
$CS parsing_queries/NPandCP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#IP-MAT+IP* = delete IP
$CS parsing_queries/deleteIP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

mv -f working/$BASE.psd output/$BASE.psd

done
