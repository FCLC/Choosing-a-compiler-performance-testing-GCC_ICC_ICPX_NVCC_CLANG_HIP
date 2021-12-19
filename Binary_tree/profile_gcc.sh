#!/bin/bash
echo "Now profiling GCC-7 to 12"
#echo "Full results are in baseline.txt, no_opt_gcc.txt and opt.txt for the respective programs"
#echo "Below is a simplifed output of the primary statistics"
#echo ""
#echo "If no results are printed, assume the program(s) errored out"

rm cpu_no_opt_gcc_output7.txt cpu_gcc_opt_output7.txt cpu_gcc_unsafe_opt_output7.txt cpu_no_opt_gcc_output8.txt cpu_gcc_opt_output8.txt cpu_gcc_unsafe_opt_output8.txt cpu_no_opt_gcc_output9.txt cpu_gcc_opt_output9.txt cpu_gcc_unsafe_opt_output9.txt cpu_no_opt_gcc_output10.txt cpu_gcc_opt_output10.txt cpu_gcc_unsafe_opt_output10.txt cpu_no_opt_gcc_output11.txt cpu_gcc_opt_output11.txt cpu_gcc_unsafe_opt_output11.txt cpu_no_opt_gcc_output12.txt cpu_gcc_opt_output12.txt cpu_gcc_unsafe_opt_output12.txt 2>/dev/null

#echo "Now profiling GCC"
echo "We profile: gcc +/- compiler opt and UNSAFE compiler opt"
echo "This may take a while"
#echo "We'll let you know when we've finished the cpu portion"

./cpu_gcc_baseline7 $TREEDEPTH >> cpu_no_opt_gcc_output7.txt
./cpu_gcc7_opt $TREEDEPTH >> cpu_gcc_opt_output7.txt
./cpu_gcc7_fast_opt $TREEDEPTH >> cpu_gcc_unsafe_opt_output7.txt
./cpu_gcc_baseline8 $TREEDEPTH >> cpu_no_opt_gcc_output8.txt
./cpu_gcc8_opt $TREEDEPTH >> cpu_gcc_opt_output8.txt
./cpu_gcc8_fast_opt $TREEDEPTH >> cpu_gcc_unsafe_opt_output8.txt
./cpu_gcc_baseline9 $TREEDEPTH >> cpu_no_opt_gcc_output9.txt
./cpu_gcc9_opt $TREEDEPTH >> cpu_gcc_opt_output9.txt
./cpu_gcc9_fast_opt $TREEDEPTH >> cpu_gcc_unsafe_opt_output9.txt
./cpu_gcc_baseline10 $TREEDEPTH >> cpu_no_opt_gcc_output10.txt
./cpu_gcc10_opt $TREEDEPTH >> cpu_gcc_opt_output10.txt
./cpu_gcc10_fast_opt $TREEDEPTH >> cpu_gcc_unsafe_opt_output10.txt
./cpu_gcc_baseline11 $TREEDEPTH >> cpu_no_opt_gcc_output11.txt
./cpu_gcc11_opt $TREEDEPTH >> cpu_gcc_opt_output11.txt
./cpu_gcc11_fast_opt $TREEDEPTH >> cpu_gcc_unsafe_opt_output11.txt
./cpu_gcc_baseline12 $TREEDEPTH >> cpu_no_opt_gcc_output12.txt
./cpu_gcc12_opt $TREEDEPTH >> cpu_gcc_opt_output12.txt
./cpu_gcc12_fast_opt $TREEDEPTH >> cpu_gcc_unsafe_opt_output12.txt


echo "Now run ./results_gcc"
#echo "Full results:"
#Copyright Felix C. LeClair
