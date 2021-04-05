"""
vs.py
=====

vs uses fileio and relies on both `diff` and `patch`.
"""

import sys
import os

import difflib

IGNORE = [".mivs"]

DIFF_FILE = ".mivs.diff"
PATCHED_FILE = ".mivs.patched"

def create_diff(oldfile : str, newfile : str, patch_file=DIFF_FILE) -> bool:
    os.system(f"diff {oldfile} {newfile} > patch_file")
    return True

def file_from_patches(basefile : str, patches : list, patch_file=PATCHED_FILE) -> bool:
    shutil.copy(basefile, patch_file)
    for patch in patches:
        os.system(f"patch {patch_file} < {patch}")
    return True

def apply_diff(diff_file, filename : str) -> bool:
    os.system(f"patch {filename} < {diff_file}")
    return True

if __name__ == "__main__":
    # TEST
    file1="I like\nmy dog\nwinston\nthe\nbest\nhe\nis"
    file2="I like\nmy dog\nlucy\nthe\nbest\nshe\nis"
    file3="I like\nmy cat\nwinston\nthe\nbest\nshe\nis"
    file4="I like\nmy dog\nwinston\nthe\nbest\nhe\nis"
    os.mkdir("patches")
    with open("base.txt", "w") as f:
        f.write(file1)
    
            
