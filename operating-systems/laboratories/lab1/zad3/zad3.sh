#!/bin/bash

srcdir=$1
dstdir=$2

for file in $(find $srcdir -readable | tail -n +2)
do
    mv "$file" "$dstdir/$(echo $file | rev | cut -d"/" -f1 | rev)"
done