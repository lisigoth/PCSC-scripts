def split(file):
    fread = open(file)
    count = 1
    fwrite = open("filenameA%s" % (count), 'w')
    for line in fread:
        if "<textdate" in line:
            fwrite.close()
            count += 1
            fwrite = open("filename%s" % (count), 'w')
            fwrite.write(line)
        else:
            fwrite.write(line)
    fwrite.close()
    fread.close()

split("f1600.vrt")
