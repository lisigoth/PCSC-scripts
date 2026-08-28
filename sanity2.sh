#!/bin/bash
CS="java -cp /Applications/CS_2.003.04.jar csearch.CorpusSearch"

for file in postcorr_sanity_version/1700s_c.psd.corr
do
BASE=`basename $file .psd.corr`
cp -f $file working/$BASE.psd

#Correcting

#make WD into WPRO
$CS postcorr_queries/WDtoWPRO.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

#add TO in bare infinitivals
$CS postcorr_queries/addTO.q working/$BASE.psd
mv -f working/$BASE.psd.out working/$BASE.psd

# done

mv -f working/$BASE.psd postcorr_sanity_version/$BASE.psd.done

done
