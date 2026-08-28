#!/bin/bash

CS="java -cp /Applications/CS_2.003.04.jar csearch.CorpusSearch"

for file in output/m1600s.psd2
do
BASE=`basename $file .psd2`
cp -f $file working/$BASE.psd

#This round
# - Starts non-finite IPs
# - Starts VPs and expands over modifiers
# - Starts CPs and adds traces

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

#P + IP-PPL = (PP P IP-PPL)
$CS parsing_queries/PandIPPPL.q working/$BASE.psd
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

mv -f working/$BASE.psd output/$BASE.psd3

done
