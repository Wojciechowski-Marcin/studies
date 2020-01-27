#!/bin/bash

find $1 -type d | wc -l

find $1 -name "*.sh" -o -name "*.pl" | wc -l

find $1 -path "*/src/*" | wc -l

find $1 -not -name "b*" | wc -l

find $1 -name "*.c" -size +100k | wc -l