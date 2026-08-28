from glob import glob

def add_IP(inputpath):
    with open(inputpath, 'a') as f:
        f.write(' ) )')
    f.close()
    with open(inputpath, 'r') as f2:
        text = f2.read()
    with open(inputpath, 'w') as f3:
        newtext = f3.write("( (IP-MAT " + text)

# add_IP("m1600s/*tag.out")

filepaths = glob("m1600_3/*tag.out")
for file_path in filepaths:
   add_IP(file_path)
