from glob import glob
import re

def merge_puncline(lines):
    cleanlines = [line for line in lines if line.strip()]
    for i, line in enumerate(cleanlines):
        if re.match("^\(PUNC [:.]\)$", line):
            # print line
            cleanlines[i-1] = cleanlines[i-1].strip() + line
            cleanlines.pop(i)
    return(cleanlines)

def merge_punc(lines):
    taglines = []
    for line in lines:
        if re.match("\(.*[=]\)\(PUNC [:.]\)", line):
            abbline1 = re.sub("\)\(PUNC ", "", line)
            print abbline1
            taglines.append(abbline1)
        elif re.match("\(.*[%]\)\(PUNC [:.]\)", line):
            abbline2 = re.sub("\)\(PUNC ", "", line)
            # print abbline2
            taglines.append(abbline2)
        elif re.match("\(.* [Ll]*[oa]*[p]*\)\(PUNC [:]\)", line):
            abbline3 = re.sub("\)\(PUNC ", "", line)
            # print abbline3
            taglines.append(abbline3)
        elif re.match("\(.* [Cc]ap\)\(PUNC [:]\)", line):
            abbline4= re.sub("\)\(PUNC ", "", line)
            # print abbline4
            taglines.append(abbline4)
        elif re.match("\(.* [Cc]o[l]+\)\(PUNC [:]\)", line):
            abbline5= re.sub("\)\(PUNC ", "", line)
            # print abbline5
            taglines.append(abbline5)
        elif re.match("\(.* (sh|do)[i]*[l]*\)\(PUNC [:]\)", line):
            abbline6= re.sub("\)\(PUNC ", "", line)
            # print abbline6
            taglines.append(abbline6)
        elif re.match("\(.* [mM]a[jd]*\)\(PUNC [:]\)", line):
            abbline7= re.sub("\)\(PUNC ", "", line)
            # print abbline7
            taglines.append(abbline7)
        elif re.match("\(NUM .*\)\(PUNC [:]\)", line):
            abbline8= re.sub("\)\(PUNC ", "", line)
            # print abbline8
            taglines.append(abbline8)
        elif re.match("\(.* [nN]o\)\(PUNC [:]\)", line):
            abbline9= re.sub("\)\(PUNC ", "", line)
            # print abbline9
            taglines.append(abbline9)
        elif re.match("\(.* [Ee]d[in]*b\)\(PUNC [:]\)", line):
            abbline10= re.sub("\)\(PUNC ", "", line)
            # print abbline10
            taglines.append(abbline10)
        elif re.match("\(.* [Gg]r[s]*\)\(PUNC [:.]\)", line):
            abbline11= re.sub("\)\(PUNC ", "", line)
            print abbline11
            taglines.append(abbline11)
        elif re.match("\(([^P].*) ([A-Za-z]{1})\)\(PUNC [:]\)", line):
            abbline12= re.sub("\)\(PUNC ", "", line)
            # print abbline12
            taglines.append(abbline12)
        # last action
        else:
            taglines.append(line)
    return taglines

def merge_numline(lines):
    cleanlines = [line for line in lines if line.strip()]
    for i, line in enumerate(cleanlines):
        if re.match("^\(NUM .*\)$", line):
            # print line
            cleanlines[i-1] = cleanlines[i-1].strip() + line
            cleanlines.pop(i)
    return(cleanlines)

def merge_puncnum(lines):
    taglines = []
    for line in lines:
        if re.match("^\(.*\)\(PUNC [:]\)\(NUM .*\)$", line):
            # print line
            numline1 = re.sub("\)\(PUNC ", "", line)
            # print numline1
            taglines.append(numline1)
        elif re.match("^\(.*\)\(NUM .*\)$", line):
            # print line
            numline2 = re.sub("\)\(", ")\n(", line)
            # print numline2
            taglines.append(numline2)
        # last action
        elif re.match("^\(.*\)\(PUNC [:.]\)$", line):
            # print line
            abblinelast= re.sub("\)\(", ")\n(", line)
            # print abblinelast
            taglines.append(abblinelast)
        else:
            taglines.append(line)
    return taglines

def process_file(inputpath):
    # print "input path is " + inputpath
    outputpath = inputpath
    # print "output path is " + outputpath
    with open(inputpath, "r") as inputf:
       lines = inputf.readlines()
       abblines1 = merge_puncline(lines)
       abblines2 = merge_punc(abblines1)
       abblines3 = merge_numline(abblines2)
       abblines4 = merge_puncnum(abblines3)
       with open(outputpath, "w") as outf:
           map(lambda line: outf.write(line), abblines4)

filepaths = glob("m1600_3/*tag.out")
for file_path in filepaths:
   process_file(file_path)
