#!/bin/bash

dir=$1

for file1 in $dir/*; do
    for file2 in $dir/*; do
        if [ $(stat -c '%i' $file1) == $(stat -c '%i' $file2) ] && [ $file1 != $file2 ]; then
            rm $file2
            ln -s $(basename $file1) $file2
        fi
    done
    
done