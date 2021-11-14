#!/bin/bash
echo "Now profiling GCC-7 8 9 and 10"
#echo "Full results are in baseline.txt, no_opt_gcc.txt and opt.txt for the respective programs"
#echo "Below is a simplifed output of the primary statistics"
#echo ""
#echo "If no results are printed, assume the program(s) errored out"

rm cpu_integer_no_opt_gcc_output7.txt cpu_integer_gcc_opt_output7.txt cpu_integer_gcc_unsafe_opt_output7.txt cpu_integer_no_opt_gcc_output8.txt cpu_integer_gcc_opt_output8.txt cpu_integer_gcc_unsafe_opt_output8.txt cpu_integer_no_opt_gcc_output9.txt cpu_integer_gcc_opt_output9.txt cpu_integer_gcc_unsafe_opt_output9.txt cpu_integer_no_opt_gcc_output10.txt cpu_integer_gcc_opt_output10.txt cpu_integer_gcc_unsafe_opt_output10.txt 2>/dev/null

#echo "Now profiling GCC"
echo "We profile: gcc +/- compiler opt and UNSAFE compiler opt"
echo "This may take a while"
#echo "We'll let you know when we've finished the cpu portion"

./cpu_integer_gcc_baseline7 >> cpu_integer_no_opt_gcc_output7.txt
./cpu_integer_gcc7_opt >> cpu_integer_gcc_opt_output7.txt
./cpu_integer_gcc7_fast_opt >> cpu_integer_gcc_unsafe_opt_output7.txt
./cpu_integer_gcc_baseline8 >> cpu_integer_no_opt_gcc_output8.txt
./cpu_integer_gcc8_opt >> cpu_integer_gcc_opt_output8.txt
./cpu_integer_gcc8_fast_opt >> cpu_integer_gcc_unsafe_opt_output8.txt
./cpu_integer_gcc_baseline9 >> cpu_integer_no_opt_gcc_output9.txt
./cpu_integer_gcc9_opt >> cpu_integer_gcc_opt_output9.txt
./cpu_integer_gcc9_fast_opt >> cpu_integer_gcc_unsafe_opt_output9.txt
./cpu_integer_gcc_baseline10 >> cpu_integer_no_opt_gcc_output10.txt
./cpu_integer_gcc10_opt >> cpu_integer_gcc_opt_output10.txt
./cpu_integer_gcc10_fast_opt >> cpu_integer_gcc_unsafe_opt_output10.txt


echo "Now run ./results_gcc"
#echo "Full results:"
