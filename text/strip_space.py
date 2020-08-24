import os

"""
Renames the filenames within the same directory
(1) Changes spaces to underscores, parenthesis to hyphens
(2) Makes lowercase
Usage:
python rename.py
"""

path = os.getcwd()
filenames = os.listdir(path)

for filename in filenames:
    os.rename(filename, filename.replace(" ", "_").replace(
        "(", "-").replace(")", "-").lower())
