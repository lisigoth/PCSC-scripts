#!/bin/bash

CS="java -cp /Applications/CS_2.003.04.jar csearch.CorpusSearch"

for file in output/m1600s.psd1
do
BASE=`basename $file .psd1`
cp -f $file working/$BASE.psd

#This round
# - starts (wh)PPs and expands them

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

# PP+NP -> PP
$CS parsing_queries/PPandADVP.q working/$BASE.psd
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

mv -f working/$BASE.psd output/$BASE.psd2

done
