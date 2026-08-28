from glob import glob

def remove_blanklines(line):
    writelines(line for line in lines if line.strip())

def process_file(inputpath):
    outputpath = inputpath + ".out"
    with open(inputpath, "r") as inputf:
        lines = inputf.readlines()
    cleanlines = remove_blanklines(lines)
    with open(outputpath, "w") as outf:
        map(lambda line: outf.write(line), cleanlines)


filepaths = glob("metadata/f1500s.txt")
print(filepaths)
for file_path in filepaths:
    process_file(file_path)
