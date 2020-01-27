#!/bin/bash

echo 'Number of lines with word google: '
grep 'google' testfiles/ -r | wc -l

echo 'Number of empty lines: '
grep '^\s*$' testfiles/ -r | wc -l

echo 'Number of non-empty lines: '
grep -v '^\s*$' testfiles/ -r | wc -l

echo "Number of lines ending with ';' : "
grep ';$' testfiles/ -r | wc -l

echo 'Number of lines contaning only two letters'
grep '^..$' testfiles/ -r | wc -l

echo 'Number of lines without numbers and _: '
grep -v '$\s*^' testfiles/ -r | wc -l

echo 'Number of lines containing two dots next to each other: '
grep '\.\.' testfiles/ -r | wc -l

echo 'Number of lines containing hexadecimal numbers'
grep '0x\w\+' testfiles/ -r | wc -l

echo 'Number of lines ending with dot and 3 letters (ex. .png): '
grep '\.[a-zA-Z]\{3\}$' testfiles/ -r | wc -l

echo 'Number of classes?: '
grep 'class' testfiles/ -r | wc -l