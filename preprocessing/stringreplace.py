from glob import glob
import re

def convert_paren(lines):
    taglines = []
    for line in lines:
        newline = line.replace("(ERROR ))", "(PUNC <rparen>)")
        newnewline = newline.replace("(ERROR ()", "(PUNC <lparen>)")
        taglines.append(newnewline)
        # print newline
        # print newnewline
    return taglines

def convert_paren2(lines):
    taglines = []
    for line in lines:
        if re.match("^\(ERROR \(.+\)$", line):
            # print line
            newline1 = line.replace("ERROR (", "PUNC <lparen>")
            # print newline1
            # taglines.append(newline1)
            newline1a = re.sub("\)\{", "<rparen>{", newline1)
            # print newline1a
            taglines.append(newline1a)
        elif "ERROR ){" in line:
            # print line
            newline2 = line.replace("ERROR ){", "PUNC <rparen>{")
            # print newline2
            taglines.append(newline2)
        elif "))" in line:
            # print line
            newline3 = line.replace("))", "<rparen>)")
            # print newline3
            taglines.append(newline3)
        else:
            taglines.append(line)
    return taglines

#add more paren e.g. (.*) and ({.*}

def replace_string(lines):
    taglines = []
    for line in lines:
        if re.match("^\((ERROR)( )(.*[ae]nc[e]*)\)$", line):
            newline2 = line.replace("ERROR", "N")
            # print newline2
            taglines.append(newline2)
        elif re.match("^\((ERROR)( )(.*[iye]t[iy][e]*)\)$", line):
            newline3 = line.replace("ERROR", "N")
            # print newline3
            taglines.append(newline3)
        elif re.match("^\((ERROR)( )([^w].*[iye]t[iy][e]*[s])\)$", line):
            newline25 = line.replace("ERROR", "NS")
            # print newline25
            taglines.append(newline25)
        elif re.match("^\((ERROR)( )(.*l[yi][i]*[e]*)\)$", line):
            newline4 = line.replace("ERROR", "ADV")
            taglines.append(newline4)
            # print newline4
        elif re.match("^\((ERROR)( )(.*c[yi][e]*)\)$", line):
            newline6 = line.replace("ERROR", "N")
            taglines.append(newline6)
            # print newline6
        elif re.match("^\((ERROR)( )(.*[^e]a[l]{1,2})\)$", line):
            newline7 = line.replace("ERROR", "ADJ")
            taglines.append(newline7)
            # print newline7
        elif re.match("^\((ERROR)( )(.*(ed|id|it|itt))\)$", line):
            newline8 = line.replace("ERROR", "VBD")
            taglines.append(newline8)
            # print newline8
        elif re.match("^\((ERROR)( )(ha.*[uvw][e]*ing)\)$", line):
            newline25 = line.replace("ERROR", "HAG")
            taglines.append(newline25)
            # print newline25
        elif re.match("^\((ERROR)( )(.*[ie]ng|i[*]n%g)\)$", line):
            newline9 = line.replace("ERROR", "VAG")
            taglines.append(newline9)
            # print newline9
        elif re.match("^\((ERROR)( )(.*f[ou][l]{1,4})\)$", line):
            newline10 = line.replace("ERROR", "ADJ")
            taglines.append(newline10)
            # print newline10
        elif re.match("^\((ERROR)( )(.*[st][i]*o[u]*n[e']*)\)$", line):
            newline12 = line.replace("ERROR", "N")
            taglines.append(newline12)
            # print newline12
        elif re.match("^\((ERROR)( )(.*[aei]*(ble|b[ie].*l[l]*))\)$", line):
            newline13 = line.replace("ERROR", "ADJ")
            taglines.append(newline13)
            # print newline13
        elif re.match("^\((ERROR)( )(.*[st][i]*o[u]*n[e]*s)\)$", line):
            newline14 = line.replace("ERROR", "NS")
            taglines.append(newline14)
            # print newline14
        # elif re.match("^\((ERROR)( )(.*[^mr][ei]nt)\)$", line):
        #     newline15 = line.replace("ERROR", "VBP")
        #     taglines.append(newline15)
        #     print newline15
        #     #BAD - inconsistent
        elif re.match("^\((ERROR)( )(.*[mr][eia]nt)\)$", line):
            newline16 = line.replace("ERROR", "VBP")
            taglines.append(newline16)
            # print newline16
        elif re.match("^\((ERROR)( )([^w].*[iye]t[iy]s)\)$", line):
            newline17 = line.replace("ERROR", "NS")
            taglines.append(newline17)
            # print newline17
        # elif re.match("^\((ERROR)( )(.*ant[e]*)\)$", line):
        #     newline18 = line.replace("ERROR", "ADJ")
        #     taglines.append(newline18)
        #     # print newline18
        #     #BAD - not enough correct
        elif re.match("^\((ERROR)( )([^wh][^th].*[eo]r)\)$", line):
            newline19 = line.replace("ERROR", "N")
            taglines.append(newline19)
            # print newline19
        elif re.match("^\((ERROR)( )(.*[eoa]rs)\)$", line):
            newline20 = line.replace("ERROR", "NS")
            taglines.append(newline20)
            # print newline20
        elif re.match("^\((ERROR)( )([A-Z].*)\)$", line):
            # print line
            newline = line.replace("ERROR", "NPR")
            # print newline
            taglines.append(newline)
        elif re.match("^\((ERROR)( )(.*ne[s]{1,2}[e]*)\)$", line):
            newline5 = line.replace("ERROR", "N")
            taglines.append(newline5)
            # print newline5
        elif re.match("^\((ERROR)( )(.*[^i][st]e)\)$", line):
            newline11 = line.replace("ERROR", "VBP")
            taglines.append(newline11)
            # print newline11
        elif re.match("^\((ERROR)( )(.+se[l]+[fv][f]*[ie]*[s]*)\)$", line):
            newline21 = line.replace("ERROR", "PRO+N")
            taglines.append(newline21)
            # print newline21
        elif re.match("^\((ERROR)( )(a[l]+.*[^d])\)$", line):
            newline22 = line.replace("ERROR", "ADV")
            taglines.append(newline22)
            # print newline22
        elif re.match("^\((ERROR)( )(.*som[e]*)\)$", line):
            newline23 = line.replace("ERROR", "ADV")
            taglines.append(newline23)
            # print newline23
        # elif re.match("^\((ERROR)( )(.*r[iy])\)$", line):
        #     newline24 = line.replace("ERROR", "N")
        #     taglines.append(newline24)
        #     print newline24
        elif re.match("^\((ERROR)( )(ple[ai][s]+[ie]*[s]*[th]*)\)$", line):
            newline24 = line.replace("ERROR", "VBP")
            taglines.append(newline24)
            # print newline24
        elif re.match("^\((ERROR)( )([^n].*less)\)$", line):
            newline26 = line.replace("ERROR", "ADJ")
            taglines.append(newline26)
            # print newline26
        elif re.match("^\((ERROR)( )(.*b[iy][s]+[ch][h]*.*o.*p.*)\)$", line):
            newline27 = line.replace("ERROR", "N")
            taglines.append(newline27)
            # print newline27
        elif re.match("^\((ERROR)( )(m[a]*(=c|c).+)\)$", line):
            newline28 = line.replace("ERROR", "NPR")
            taglines.append(newline28)
            # print newline28
        elif re.match("^\((ERROR)( )(se[l]+[fv][f]*[ie]*[s]*)\)$", line):
            newline29 = line.replace("ERROR", "N")
            taglines.append(newline29)
            # print newline29
        elif re.match("^\((ERROR)( )(h[uo]*[uw].*n.*d[e]*ret[h]*[e]*.*)\)$", line):
            newline30 = line.replace("ERROR", "ADJ")
            taglines.append(newline30)
            # print newline30
        elif re.match("^\((ERROR)( )(.+land)\)$", line):
            newline31 = line.replace("ERROR", "NPR")
            taglines.append(newline31)
            # print newline31
        elif re.match("^\((ERROR)( )(.+landis)\)$", line):
            newline32 = line.replace("ERROR", "NPR$")
            taglines.append(newline32)
            # print newline32
        elif re.match("^\((ERROR)( )(_[^m].*[^ai]l[l]*)\)$", line):
            newline33 = line.replace("ERROR", "MD")
            taglines.append(newline33)
            # print newline33
        elif re.match("^\((ERROR)( )(wou.*d)\)$", line):
            newline34 = line.replace("ERROR", "MD")
            taglines.append(newline34)
            # print newline34
        elif re.match("^\((ERROR)( )(_.*m)\)$", line):
            newline35 = line.replace("ERROR", "BEP")
            taglines.append(newline35)
            # print newline35
        elif re.match("^\((ERROR)( )(cou.*d)\)$", line):
            newline36 = line.replace("ERROR", "MD")
            taglines.append(newline36)
            # print newline36
        elif re.match("^\((ERROR)( )(_n.*t)\)$", line):
            newline37 = line.replace("ERROR", "NEG")
            taglines.append(newline37)
            # print newline37
        elif re.match("^\((ERROR)( )(.*r[yi][e]*)\)$", line):
            newline38 = line.replace("ERROR", "N")
            taglines.append(newline38)
            # print newline38
        elif re.match("^\((ERROR)( )(.*eth)\)$", line):
            newline39 = line.replace("ERROR", "VBP")
            taglines.append(newline39)
            # print newline39
        elif re.match("^\((ERROR)( )(.*[^h]ous)\)$", line):
            newline40 = line.replace("ERROR", "ADJ")
            taglines.append(newline40)
            # print newline40
        else:
            taglines.append(line)
    return taglines

def num_errors(lines):
    taglines = []
    for line in lines:
        if re.match("^\((ERROR)( )(([i]*[0-9]+)(.th.|th|t|.t.|.d.|d|rd).*)\)$", line):
            # print line
            numline = line.replace("ERROR", "ADJ")
            # print numline
            taglines.append(numline)
        elif re.match("^\((ERROR)( )([i]*[0-9]+[i]*[0-9]*)\)$", line):
            # print line
            numline2 = line.replace("ERROR", "NUM")
            # print numline2
            taglines.append(numline2)
        else:
            taglines.append(line)
            # print line
    return taglines

def wh_errors(lines):
    taglines = []
    for line in lines:
        if re.match("^\((ERROR)( )([wq][u]*[h]*[^ao][^t].*o[f]+)\)$", line):
            # print line
            whline = line.replace("ERROR", "WADV+P")
            # print whline
            taglines.append(whline)
            #e.g. whereof
        elif re.match("^\((ERROR)( )([wq][u]*[h]*.*for[e]*)\)$", line):
            # print line
            whline2 = line.replace("ERROR", "WADV+P")
            # print whline2
            taglines.append(whline2)
            #e.g. wherefore
        elif re.match("^\((ERROR)( )([wq][u]*[h]*.*to)\)$", line):
            # print line
            whline6 = line.replace("ERROR", "WADV+P")
            # print whline6
            taglines.append(whline6)
            #where(un)to
        elif re.match("^\((ERROR)( )([wq][u]*[h][ea]*[i]*r[e]*)\)$", line):
            # print line
            whline3 = line.replace("ERROR", "WADV")
            # print whline3
            taglines.append(whline3)
            # e.g. where
        elif re.match("^\((ERROR)( )(h[w]*o[uw]+[e]*)\)$", line):
            # print line
            whline4 = line.replace("ERROR", "WADV")
            # print whline4
            taglines.append(whline4)
            #how
        elif re.match("^\((ERROR)( )([wq][u]*[h]*.*[^d]on[e]*)\)$", line):
            # print line
            whline5 = line.replace("ERROR", "WADV+P")
            # print whline5
            taglines.append(whline5)
            # where(up)on
        elif re.match("^\((ERROR)( )([wq][u]*[h]*[ea][i]*r.*w[i]*(th|.t.|))\)$", line):
            # print line
            whline7 = line.replace("ERROR", "WADV+P")
            # print whline7
            taglines.append(whline7)
            # wherewith
        elif re.match("^\((ERROR)( )([wq][u]*[h]*[ie]th[ie]r)\)$", line):
            # print line
            whline8 = line.replace("ERROR", "WQ")
            # print whline8
            taglines.append(whline8)
            #whether
        elif re.match("^\((ERROR)( )([wq][u]*[h]*.*anent)\)$", line):
            # print line
            whline9 = line.replace("ERROR", "WADV+P")
            # print whline9
            taglines.append(whline9)
        elif re.match("^\((ERROR)( )([wq][u]*[h]*.*r.*by)\)$", line):
            # print line
            whline10 = line.replace("ERROR", "WADV+P")
            # print whline10
            taglines.append(whline10)
            #whereby
        elif re.match("^\((ERROR)( )([wq][u]*[h]*.*[^t]r[e]*.*in)\)$", line):
            # print line
            whline11 = line.replace("ERROR", "WADV+P")
            # print whline11
            taglines.append(whline11)
            #wherein
        elif re.match("^\((ERROR)( )([wq][u]*[h]*.*t.*e[uvw][ie].*r)\)$", line):
            # print line
            whline12 = line.replace("ERROR", "WD+ADV")
            # print whline12
            taglines.append(whline12)
            #what(so)ever
        elif re.match("^\((ERROR)( )([wq][u]*[h]*[ae]*[i]*r[e]*a[st])\)$", line):
            # print line
            whline13 = line.replace("ERROR", "WD+ADV")
            # print whline13
            taglines.append(whline13)
            #whereas/at
        elif re.match("^\((ERROR)( )([wq][u]*[h]*[oa].*e[uvw][ie].*r)\)$", line):
            # print line
            whline14 = line.replace("ERROR", "WPRO+ADV")
            # print whline14
            taglines.append(whline14)
            #who(so)ever
        elif re.match("^\((ERROR)( )([wq][u]*[h][oa][^t][^l])\)$", line):
            # print line
            whline4a = line.replace("ERROR", "WPRO$")
            # print whline4a
            taglines.append(whline4a)
            #who?
        elif re.match("^\((ERROR)( )([wq][u]*h[oa][ewu]*[m]*)\)$", line):
            # print line
            whline4 = line.replace("ERROR", "WPRO")
            # print whline4
            taglines.append(whline4)
            #who?
        elif re.match("^\((ERROR)( )([wq][u]*[h]*.*n.*e[uvw][ie].*r)\)$", line):
            # print line
            whline15 = line.replace("ERROR", "WD+ADV")
            # print whline15
            taglines.append(whline15)
            #whenever
        elif re.match("^\((ERROR)( )([wq][u]*[h]*[a]*[t]+)\)$", line):
            # print line
            whline16 = line.replace("ERROR", "WD+ADV")
            # print whline16
            taglines.append(whline16)
            #whenever
        elif re.match("^\((ERROR)( )(h[w]*o[uw]+[e]*.*e[uvw][ie].*r)\)$", line):
            # print line
            whline17 = line.replace("ERROR", "WADV")
            # print whline17
            taglines.append(whline17)
            #how(so)ever
        else:
            taglines.append(line)
    return taglines

# def advp_errors(lines):
#     taglines = []
#     for line in lines:
#         if re.match("^\((ERROR)( )([t]h.*[ae]fter)\)$", line):
#             # print line
#             advpline = line.replace("ERROR", "ADV+P")
#             # print advpline
#             taglines.append(advpline)
#         elif re.match("^\((ERROR)( )([t]*h.*on)\)$", line):
#             # print line
#             advpline2 = line.replace("ERROR", "ADV+P")
#             # print advpline2
#             taglines.append(advpline2)
#         else:
#             taglines.append(line)
#     return taglines

def p_compounds(lines):
    taglines = []
    for line in lines:
        if re.match("^\((ERROR)( )(.*[ae]ft(er|.er.))\)$", line):
            # print line
            pline = line.replace("ERROR", "ADV+P")
            # print pline
            taglines.append(pline)
        elif re.match("^\((ERROR)( )([thy].*[o]{1}[fn][f]*)\)$", line):
            # print line
            pline2 = line.replace("ERROR", "ADV+P")
            # print pline2
            taglines.append(pline2)
        elif re.match("^\((ERROR)( )([thy].*anent)\)$", line):
            # print line
            pline3 = line.replace("ERROR", "ADV+P")
            # print pline3
            taglines.append(pline3)
        elif re.match("^\((ERROR)( )(.*ti[l]{1,4})\)$", line):
            # print line
            pline4 = line.replace("ERROR", "P")
            # print pline4
            taglines.append(pline4)
        elif re.match("^\((ERROR)( )([thy].*by)\)$", line):
            # print line
            pline5 = line.replace("ERROR", "ADV+P")
            # print pline5
            taglines.append(pline5)
        elif re.match("^\((ERROR)( )([thy].*r.*t.*[h]*)\)$", line):
            # print line
            pline6 = line.replace("ERROR", "ADV+P")
            # print pline6
            taglines.append(pline6)
        elif re.match("^\((ERROR)( )([thy].*r.*in)\)$", line):
            # print line
            pline7 = line.replace("ERROR", "ADV+P")
            # print pline7
            taglines.append(pline7)
        elif re.match("^\((ERROR)( )([thy].*r.*to)\)$", line):
            # print line
            pline8 = line.replace("ERROR", "ADV+P")
            # print pline8
            taglines.append(pline8)
        elif re.match("^\((ERROR)( )([thy].*r.*fo[i]*r[e]*)\)$", line):
            # print line
            pline9 = line.replace("ERROR", "ADV+P")
            # print pline9
            taglines.append(pline9)
        elif re.match("^\((ERROR)( )(([ae]ft(er|.er.)).*)\)$", line):
            # print line
            pline10 = line.replace("ERROR", "ADV")
            # print pline10
            taglines.append(pline10)
        else:
            taglines.append(line)
    return taglines

def process_file(inputpath):
    # print "input path is " + inputpath
    outputpath = inputpath + ".out"
    # print "output path is " + outputpath
    with open(inputpath, "r") as inputf:
       lines = inputf.readlines()
       parenlines1 = convert_paren(lines)
       parenlines = convert_paren2(parenlines1)
       nprlines = replace_string(parenlines)
       numlines = num_errors(nprlines)
       whlines = wh_errors(numlines)
       plines = p_compounds(whlines)
       with open(outputpath, "w") as outf:
           map(lambda line: outf.write(line), plines)

filepaths = glob("m1600_3/*tag")
for file_path in filepaths:
   process_file(file_path)
