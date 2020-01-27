#!/bin/bash

filename='lista.txt'
done=false

until $done; do
    read line || done=true
    echo $line
    wget -q $line -P ./downloads
done < $filename