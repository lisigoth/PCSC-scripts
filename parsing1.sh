#!/bin/bash

CS="java -cp /Applications/CS_2.003.04.jar csearch.CorpusSearch"

for file in m1600s.pos
do
BASE=`basename $file .pos`
cp -f $file working/$BASE.psd

#This round
# - corrects ERRORs in uncorrected files
# - starts (W)NPs, ADJPs, and (W)ADVPs
# - expands ADJP
# - expands NP

# ERRORet -> _ = VBD
$CS parsing_queries/makeVBD.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd


#Make NPs, NUMPs, and WNPs

# NPR + NPR = NP
$CS parsing_queries/NPRandNPR.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

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

#Make ADJPs and (W)ADVPs and include them in NP, and make headless NPs with ADJ

# ADJ + NP = NP
$CS parsing_queries/AdjandNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

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

# # D + OTHER = (NP OTHER)
# $CS parsing_queries/StartNP-OTH.q working/$BASE.psd
# mv -f working/$BASE.psd.out working/$BASE.psd
#
# # D + (NP OTHER) = (NP D OTHER)
# $CS parsing_queries/DandNP-OTH.q working/$BASE.psd
# mv -f working/$BASE.psd.out working/$BASE.psd

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

#start NPs from remaining ONE or OTHER

# ONE|OTHER = NP
$CS parsing_queries/StartNP2.q working/$BASE.psd
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


mv -f working/$BASE.psd output/$BASE.psd1

done
