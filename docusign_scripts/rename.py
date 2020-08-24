import subprocess
import glob
import os
from shutil import copyfile

# Grab all PDF files in a directory, scan for a DocuSign Envelope ID Number
# and create a copy of that pdf file with the DocuSign Envelope ID Number
# as the file name in a new directory.

os.chdir(".")  # In this directory
for file in glob.glob("*.pdf"):  # For all files with extension .pdf
    # set src and dst path to variable
    path = "/Users/dannymayer/OneDrive/Tech/DocuSign/"
    dstpath = "/Users/dannymayer/OneDrive/Tech/DocuSign/rename/"

    # grep Envelope ID from PDF
    pdf_text = str(subprocess.check_output(
        'pdfgrep -F "DocuSign Envelope ID" ' + file, shell=True))

    # sanitize ID for name replacement
    pdf_text = pdf_text[11:-3].replace(" ", "").replace(":", "_")

    # set src and dst for each file
    dst = str(pdf_text) + ".pdf"
    src = str(path + file)
    dst = dstpath + dst

    # copy file with updated name to new folder
    copyfile(src, dst)
