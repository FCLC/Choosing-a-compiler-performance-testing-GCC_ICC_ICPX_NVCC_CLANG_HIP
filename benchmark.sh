#!/bin/bash

echo "	Welcome to the quick and dirty compiler profiler!"

echo "" 

echo "	Running this script takes a long time, but can provide interesting results for your system."

echo "	This script gets different compillers to compile and then run a simple baseline program that adds two elements of arrays together, where each array is of size 2^27"
echo "	The default behaviour is to do this 16 times and then output the total launch to program exit time to std:out if a program is launched on it's own, or to a log file if launched by a scipt."

echo ""
echo "	Currently this version tests the baseline, safe and unsafe optimizations levels of:"
echo "	GCC 7 8 9 10"
echo "	Clang  7 8 9 10 11 12"
echo "	NVCC"
echo "	Intel ICPX/ICPC"

echo ""

echo "	This will take a LONG time, I suggest going to get a cup of coffee/tea etc."
./clean.sh 

./compile_gcc.sh && ./compile_clang.sh && ./compile_nvcc.sh && ./compile_intel.sh

./profile_gcc.sh && ./profile_clang.sh && ./profile_nvcc.sh && ./profile_intel.sh

./results_gcc.sh && ./results_clang.sh && ./results_nvcc.sh && ./results_intel.sh
