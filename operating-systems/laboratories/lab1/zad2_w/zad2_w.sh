#!/bin/bash

rm -rf files
mkdir files

val1=$1
val2=$2
if (($1>$2))
then
    val2=$1
    val1=$2
fi

for ((i=$val1; i<=$val2; i++))
do
    touch "./files/plik$i"
done