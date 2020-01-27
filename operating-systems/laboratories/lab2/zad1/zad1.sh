#!/bin/bash

fileCtr=0
linkCtr=0
path=./

for file in *
do
    # jesli plik jest linkiem
    if [[ -L $file ]]; then
        # jesli cel linku istnieje
        if [[ -e $(readlink $file) ]]; then
            ((fileCtr+=1))
        fi
        ((linkCtr+=1))
    fi
done
echo Ilosc istniejacych plikow: $fileCtr
echo Ilosc linkow: $linkCtr