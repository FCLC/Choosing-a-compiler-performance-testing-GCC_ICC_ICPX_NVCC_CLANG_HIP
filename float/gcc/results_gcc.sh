#!/bin/bash

##CPU RESULTS

echo "Results of CPU GCC 7 baseline:"
cat cpu_no_opt_gcc_output7.txt 
#| grep 'Time taken by'
echo ""

echo "Results of CPU GCC 7 optimized:"
cat cpu_gcc_opt_output7.txt
# | grep 'Time taken by'
echo ""

echo "Results of CPU UNSAFE GCC 7 optimized:"
cat cpu_gcc_unsafe_opt_output7.txt
# | grep 'Time taken by'
echo ""


echo "Results of CPU GCC 8 baseline:"
cat cpu_no_opt_gcc_output8.txt 
#| grep 'Time taken by'
echo ""

echo "Results of CPU GCC 8 optimized:"
cat cpu_gcc_opt_output8.txt
# | grep 'Time taken by'
echo ""

echo "Results of CPU UNSAFE GCC 8 optimized:"
cat cpu_gcc_unsafe_opt_output8.txt
# | grep 'Time taken by'
echo ""


echo "Results of CPU GCC 9 baseline:"
cat cpu_no_opt_gcc_output9.txt 
#| grep 'Time taken by'
echo ""

echo "Results of CPU GCC 9 optimized:"
cat cpu_gcc_opt_output9.txt
# | grep 'Time taken by'
echo ""

echo "Results of CPU UNSAFE GCC 9 optimized:"
cat cpu_gcc_unsafe_opt_output9.txt
# | grep 'Time taken by'
echo ""

echo "Results of CPU GCC 10 baseline:"
cat cpu_no_opt_gcc_output10.txt 
#| grep 'Time taken by'
echo ""

echo "Results of CPU GCC 10 optimized:"
cat cpu_gcc_opt_output10.txt
# | grep 'Time taken by'
echo ""

echo "Results of CPU UNSAFE GCC 10 optimized:"
cat cpu_gcc_unsafe_opt_output10.txt
# | grep 'Time taken by'
echo ""

