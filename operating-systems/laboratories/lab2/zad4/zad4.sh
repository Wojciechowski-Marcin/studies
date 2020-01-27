#!/bin/bash

dir=$1

for file in $dir/*; do
    # jeśli plik jest symlinkiem
    if [ -L $file ]; then
        lReal=$(readlink -m $file)
        # jesli link wskazuje na plik w innym katalogu
        if [ $(dirname $lReal) != $(realpath $dir) ]; then
            ln -f $(realpath $lReal) "$file"
        fi
    fi
done