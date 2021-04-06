#!/bin/bash

# Used to demo functionality

mkdir auto_readme_test
cd auto_readme_test

mivs -i
echo "Hello world!" > README.md

mivs -r "Created README"

mkdir src
echo "print('wow!')" > src/main.py
echo "sq = lambda x : x**2" > src/math.py
mivs -r "Added other code"

echo -e "I added another sentence.\nOr two!" >> README.md
mivs -r "Updated README"

mivs -l

mivs -s "README"
ls

mivs -j 0
ls

mivs -j 1
ls

mivs -j 2
ls

# Cleanup
cd ..
