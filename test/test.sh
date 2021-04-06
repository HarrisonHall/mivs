#!/bin/bash

# Create directory
echo "Setup"
rm -rf autotest
mkdir autotest
cd autotest

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
