from glob import glob
import re

def remove_tags(lines):
    cleanlines = []
    for line in lines:
        isthisok = 1
        tags = ["`", "/", "<sentence", "<paragraph", "<text", "<line>", "</line>", "</text>", "</sentence>", "</paragraph>"]
        for tag in tags:
            if tag in line:
                isthisok = 0
                # print line
        if isthisok == 1:
            cleanlines.append(line)
    return(cleanlines)

def remove_comments(lines):
    cleanlines = []
    for line in lines:
        if not re.match("^\{[^=].*\}", line):
            cleanlines.append(line)
        # else:
        #     print line
    return(cleanlines)

def remove_slashlines(lines):
    cleanlines = [line for line in lines if line.strip()]
    for i, line in enumerate(cleanlines):
        if re.match(r"^\\", line):
            # print(line)
            cleanlines.pop(i)
    return(cleanlines)

def merge_line(lines):
    cleanlines = [line for line in lines if line.strip()]
    for i, line in enumerate(cleanlines):
        if re.match("^\{=.*\}", line):
            # print line
            cleanlines[i-1] = cleanlines[i-1].strip() + line
            cleanlines.pop(i)
    return(cleanlines)

def convert_html(lines):
    cleanlines = []
    for line in lines:
        nospaceline = re.sub(r"[\t]*", "", line)
        newline = nospaceline.replace('&quot;', "'")
        newnewline = newline.replace('&amp;', '&')
        cleanlines.append(newnewline)
        # if newnewline != line:
        #     print line
        #     print newnewline
    return cleanlines

def process_file(inputpath):
    # print "input path is " + inputpath
    outputpath = inputpath + ".out"
    # print "output path is " + outputpath
    with open(inputpath, "r") as inputf:
       lines = inputf.readlines()
       tagfreelines = remove_tags(lines)
       commentfreelines = remove_comments(tagfreelines)
       slashfreelines = remove_slashlines(commentfreelines)
       oddcommentfreelines = merge_line(slashfreelines)
       reallycleanlines = convert_html(oddcommentfreelines)
       with open(outputpath, "w") as outf:
           map(lambda line: outf.write(line), reallycleanlines)


filepaths = glob("m1700/*.vrt")
for file_path in filepaths:
   process_file(file_path)

# process_file("f1540/3_3_f1540.vrt")
