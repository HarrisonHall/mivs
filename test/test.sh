#!/bin/bash

# Create directory
echo "Setup"
mkdir testingdir
cd testingdir

echo "Creating file1.txt"
echo -e "something\nsomething" > file1.txt
cat file1.txt


echo "Cleanup"
cd ..
rm -rf testingdir
