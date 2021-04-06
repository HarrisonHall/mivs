#!/bin/bash

# Simple test to use mivs functions which can be evaluated manually

# Create directory
echo "Setup"
rm -rf autotest
mkdir autotest
cd autotest
mkdir 1
cd 1

echo "Creating file1.txt"
echo -e "something1\nsomething2\nsomething3" > file1.txt
cat file1.txt

echo "Creating mivs"
mivs -i

echo -e "\n===\n"
echo "Creating record1"
echo -e "something1\nsomething0\nsomething3" > file1.txt
mivs -r "Record for something0"
cat file1.txt

echo -e "\n===\n"
echo "Creating record2"
echo -e "something1\nsomething99\nsomething3" > file1.txt
mivs -r "Record for something99"
cat file1.txt

echo -e "\n===\n"
echo "Jumping to record1"
mivs -j 1
cat file1.txt

echo -e "\n===\n"
echo "Jumping to record0"
mivs -j 0
cat file1.txt

echo -e "\n===\n"
echo "Jumping to record2"
mivs -j 2
cat file1.txt

echo -e "\n===\n"
echo "Searching for record2"
mivs -s 2

echo -e "\n===\n"
echo "Searching for something0"
mivs -s something0

echo -e "\n===\n"
echo "Record a directory digdog"
mkdir digdog
echo -e "I'm a diggy dog\ndude" > digdog/dog.txt
mivs -r "added a directory digdog"

mivs -j 0
mivs -j current
cat digdog/dog.txt

cd ..

# Test merging
echo -e "\n===\n"
echo "Testing merging"
cd 1
echo -e "Who\nLet\nthe\ndogs\nout" > file1.txt
mivs -r "who let the dogs out"
cd ..
cp -r 1 2
echo -e "Who\nLet\nthe\ncats\nout" > 2/file1.txt
echo "About to merge"
mivs -m 1 2 3

# Cleanup
cd ..
