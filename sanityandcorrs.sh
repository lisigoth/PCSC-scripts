#!/bin/bash
CS="java -cp /Applications/CS_2.003.04.jar csearch.CorpusSearch"

for file in postcorr_sanity_version/1700s_c.psd.fin
do
BASE=`basename $file .psd.fin`
cp -f $file working/$BASE.psd

#Correcting

#make EX to NP-SBJ
$CS postcorr_queries/EXtoSBj.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#Flagging

# flag NP-MSR daughters of NP (to change to QP)
$CS postcorr_queries/MSRtoQP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# find single Qs as NP daughters
$CS postcorr_queries/findQ.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# find IP-SUB daughters of PP without CP-ADV layer
$CS postcorr_queries/fixCPadv.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# find CPs with no Wh-word
$CS postcorr_queries/CPnoW.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#find un-appended NPs and ADVPs
$CS postcorr_queries/blankNP.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# $CS postcorr_queries/blankADVP.q working/$BASE.psd
# mv -f working/$BASE.psd.out working/$BASE.psd
# (unecessary for later periods, check manually)

#find subject-less clauses
$CS postcorr_queries/noSBJ.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# find double finV
$CS postcorr_queries/doublefinV.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# find inf without TO and without arb sbj
$CS postcorr_queries/inf-noTO.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/inf-noSBJ.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# find and flag "pray"
$CS postcorr_queries/find-pray.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# find potential WADV when
$CS postcorr_queries/findWhen.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# find PP 'as' daughters of NP
$CS postcorr_queries/PPas.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#check if works

# find expletives without traces
$CS postcorr_queries/coindex_exp.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/coindex_it1.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/coindex_it2.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/coindex_it3.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# find double verbs
$CS postcorr_queries/doublefinV.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# B's bad coordination queries

$CS postcorr_queries/bad-conj1.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/bad-conj2.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/bad-conj3.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/bad-conj4.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/bad-conj5.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/bad-conj6.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/bad-conj7.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/bad-conj8.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/bad-conj9.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/bad-conj10.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/bad-conj11.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/bad-conj12.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

$CS postcorr_queries/bad-conj13.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# done

mv -f working/$BASE.psd postcorr_sanity_version/$BASE.psd.corr

done
