from shutil import copyfile
import glob
import subprocess
import os

"""
Concatenates files in the same directory if files have matching DocuSign
Envelope IDs.
(1) Sanitize Document names in a directory
(2) Loop over documents in the directory & check for IDs
(3) If multiple documents have matching ID, concatenate to new file
(4) Move new file to source directory
(5) Delete old files

"""

# 1. Sanitize Document Names in a directory
path = os.getcwd()
filenames = os.listdir(path)

for filename in filenames:
    os.rename(filename, filename.replace(" ", "_").replace(
        "(", "-").replace(")", "-").lower())

# 2. Loop over documents in the directory and check for DocuSign Envelope ID
os.chdir(".")  # In this directory
for file in glob.glob("*.pdf"):  # For all files with extension .pdf
    # set src and dst path to variable
    dstpath = path + 'sorted'
    print(dstpath)

    # grep Envelope ID from PDF
    # pdf_text = str(subprocess.check_output('pdfgrep -F "DocuSign Envelope ID" ' + file, shell=True))
    # sanitize ID for name replacement
    # pdf_text = pdf_text[11:-3].replace(" ", "").replace(":", "_")

    # set src and dst for each file
    # dst = str(pdf_text) + ".pdf"
    # src = str(path + file)
    # dst = dstpath + dst

    # copy file with updated name to new folder
    # copyfile(src, dst)
