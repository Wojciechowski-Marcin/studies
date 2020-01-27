#!/bin/bash

dir=*
func=$(find $dir -executable)

count=$(echo $func | wc -l)
for file in $func
do
    echo $file
done
echo $count

