#!/bin/bash

rm result
touch result

while read line; do
   echo "'$line'" >> result
   cat $line >> result
done < $1
