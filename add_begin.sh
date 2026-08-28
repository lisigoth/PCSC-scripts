#!/bin/bash

# add file name as header to .psd file

for file in m1600_3/*tag.out

do

        BASE=`basename $file .tag.out`

        echo "( (CODE <BEGIN_$BASE>))" > working/$BASE.tmp
        echo "" >> working/$BASE.tmp

        cat m1600_3/$BASE.tag.out >> working/$BASE.tmp

        cat -s working/$BASE.tmp > m1600_3/$BASE.tag.out

done
