# Use Pandoc CLI to convert a word doc to markdown. Specify word file type, markdown flavor, and file names 

pandoc -f <docx> -t <markdown> -o test.md test.docx