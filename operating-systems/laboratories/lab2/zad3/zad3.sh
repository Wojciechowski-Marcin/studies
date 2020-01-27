#!/bin/bash

src=$1
dst=$2

for file in $(ls $src); do
    if [ ! -L $src/$file ] && [ ! -d $src/$file ]; then
        ln $(realpath "$src/$file") $dst/$file
    fi
done