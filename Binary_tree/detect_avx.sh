#!/bin/bash

#Copyright Felix C. LeClair

## prints out all supported avx instructions supported by the host cpu, then appends them to -m so they can be used as compiler flag arguments

lscpu | tr " " "\n" | tr "_" "-" | grep avx | sed 's/avx/-mavx/' | tr "\n" " "
#echo 
