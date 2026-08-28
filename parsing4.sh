#!/bin/bash

CS="java -cp /Applications/CS_2.003.04.jar csearch.CorpusSearch"

for file in output/m1600s.psd3
do
BASE=`basename $file .psd3`
cp -f $file working/$BASE.psd

#This round
# - Expands VPs to cover immediate complements
# - Changes VP label to IP
# - Expands and embeds the IPs and turns them into IP-Sub
# - Finally deletes double IPs

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
