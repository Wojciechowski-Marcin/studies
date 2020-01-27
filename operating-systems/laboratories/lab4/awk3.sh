#!/bin/bash

awk '{if(/[0-9]/){print toupper($0)} else {print $0}}' grep.sh