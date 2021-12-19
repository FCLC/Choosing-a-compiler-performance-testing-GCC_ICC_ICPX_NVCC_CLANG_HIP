#!/bin/bash

#Copyright Felix C. LeClair

echo "	Welcome to the quick and dirty compiler profiler!"

echo "" 

echo "	Running this script takes a long time, but can provide interesting results for your system."

#echo "	This script gets different compillers to compile and then run a simple baseline program that adds two elements of arrays together, where each array is of size 2^27"
#echo "	The default behaviour is to do this 16 times and then output the total launch to program exit time to std:out if a program is launched on it's own, or to a log file if launched by a scipt."

#echo ""
echo "	Currently this version tests the baseline, safe and unsafe optimizations levels of:"
echo "	GCC 7 8 9 10 11 12"
echo "	Clang 11 12 13"
#echo "	NVCC"
echo "	Intel ICPX/ICPC"

echo ""

echo "	This will take a LONG time, I suggest going to get a cup of coffee/tea etc."
./clean.sh 

./compile_gcc.sh && ./compile_clang.sh && ./compile_intel.sh

./profile_gcc.sh && ./profile_clang.sh && ./profile_intel.sh

echo && echo 'gcc numbers' &&  ./results_gcc.sh 
echo && echo 'clang numbers' && ./results_clang.sh
echo && echo 'intel numbers' && ./results_intel.sh

echo 
echo 'Above tests were completed with Tree size of' $TREEDEPTH 
echo 'You can modify this number via enviroment variable. Remember that larger trees take up more system memory'
echo 'If no number is printed or you got a segfault, try setting $TREEDEPTH. A low number such as 16 is a good starting point'
echo ''
echo 'Also make sure you set your AVX flags correctly. To print the AVX(1, 2 or 512) instructions supported by your system, use the provided "detect_avx.sh" script'
echo 'You can then use "CFLAGS=`./detect_avx.sh`" to add the flags directly. Any unsupported flags will be caught (and complained about) by your compiler'
echo 'Different compilers support different levels of AVX. For the sake of convenience this script is setup to use 3 different levels of flags, deliniated at the gcc-10>=, gcc 8-9 and gcc-7<='
echo 'if set, they will now be printed:'
echo  $CFLAGS
echo  $OldCflags
echo  $LegacyCflags 



