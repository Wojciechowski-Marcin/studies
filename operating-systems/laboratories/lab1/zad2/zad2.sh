#!/bin/bash
IFS=$'\n'
dir=*

for file in $(ls -l $dir)
do 
    if (( $(echo $file | awk '{print $5}')==0 )); then
        rm $(echo $file | awk '{print $9}')
    fi
done
