#!/bin/bash

echo "	Welcome to the quick and dirty compiler profiler!"

echo "" 

echo "	Running this script can take a long time, but can provide interesting results for your system."

#echo "	This script gets different compillers to compile and then run a simple baseline program that adds two elements of arrays together, where each array is of size 2^27"
#echo "	The default behaviour is to do this 16 times and then output the total launch to program exit time to std:out if a program is launched on it's own, or to a log file if launched by a scipt."

#echo ""
echo "	Currently this version tests the MAXIMUM optimizations levels of:"
echo "	GCC 7 8 9 10 11 12"
echo "	Clang 11 12 13"
echo "	Intel ICPX/ICPC"

echo ""

echo "	This MAY take a LONG time, I suggest going to get a cup of coffee/tea etc."
./clean.sh 

./compile_gcc.sh 2>/dev/null 1>/dev/null && ./compile_clang.sh 2>/dev/null 1>/dev/null && ./compile_intel.sh  2>/dev/null 1>/dev/null


echo && echo 'gcc numbers 7 8 9 10 11 12' 
./cpu_gcc7_fast_opt $TREEDEPTH
./cpu_gcc8_fast_opt $TREEDEPTH
./cpu_gcc9_fast_opt $TREEDEPTH
./cpu_gcc10_fast_opt $TREEDEPTH
./cpu_gcc11_fast_opt $TREEDEPTH
./cpu_gcc12_fast_opt $TREEDEPTH

echo && echo 'clang numbers 11 12 13' 
./cpu_clang11_fast_opt $TREEDEPTH
./cpu_clang12_fast_opt $TREEDEPTH
./cpu_clang13_fast_opt $TREEDEPTH


echo && echo 'intel numbers icc icx' 

./cpu_icc_fast_opt $TREEDEPTH
./cpu_icc_fast_opt $TREEDEPTH

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
