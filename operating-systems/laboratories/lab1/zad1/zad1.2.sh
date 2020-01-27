#!/bin/bash

dir=*
func=$(ls -l $dir | awk -v OFS=' ' '{print $1, $9}')

for file in $(echo $func); do
    echo $file
done