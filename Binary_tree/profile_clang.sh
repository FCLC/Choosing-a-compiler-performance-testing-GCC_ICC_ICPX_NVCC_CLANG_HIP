#!/bin/bash
echo "Now profiling clang 7 to 13"
#echo "Full results are in baseline.txt, no_opt_clang.txt and opt.txt for the respective programs"
#echo "Below is a simplifed output of the primary statistics"
#echo ""
#echo "If no results are printed, assume the program(s) errored out"

rm cpu_no_opt_clang_output7.txt cpu_clang_opt_output7.txt cpu_clang_unsafe_opt_output7.txt cpu_no_opt_clang_output8.txt cpu_clang_opt_output8.txt cpu_clang_unsafe_opt_output8.txt cpu_no_opt_clang_output9.txt cpu_clang_opt_output9.txt cpu_clang_unsafe_opt_output9.txt cpu_no_opt_clang_output10.txt cpu_clang_opt_output10.txt cpu_clang_unsafe_opt_output10.txt cpu_no_opt_clang_output11.txt cpu_clang_opt_output11.txt cpu_clang_unsafe_opt_output11.txt cpu_no_opt_clang_output12.txt cpu_clang_opt_output12.txt cpu_clang_unsafe_opt_output12.txt cpu_no_opt_clang_output13.txt cpu_clang_opt_output13.txt cpu_clang_unsafe_opt_output13.txt 2>/dev/null

#echo "Now profiling clang"
echo "Currently we profile: clang +/- compiler opt and UNSAFE compiler opt"
#echo "This may take a while"
#echo "We'll let you know when we've finished the cpu portion"

./cpu_clang_baseline7 $TREEDEPTH >> cpu_no_opt_clang_output7.txt
./cpu_clang7_opt $TREEDEPTH >> cpu_clang_opt_output7.txt
./cpu_clang7_fast_opt $TREEDEPTH >> cpu_clang_unsafe_opt_output7.txt
./cpu_clang_baseline8 $TREEDEPTH >> cpu_no_opt_clang_output8.txt
./cpu_clang8_opt $TREEDEPTH >> cpu_clang_opt_output8.txt
./cpu_clang8_fast_opt $TREEDEPTH >> cpu_clang_unsafe_opt_output8.txt
./cpu_clang_baseline9 $TREEDEPTH >> cpu_no_opt_clang_output9.txt
./cpu_clang9_opt $TREEDEPTH >> cpu_clang_opt_output9.txt
./cpu_clang9_fast_opt $TREEDEPTH >> cpu_clang_unsafe_opt_output9.txt
./cpu_clang_baseline10 $TREEDEPTH >> cpu_no_opt_clang_output10.txt
./cpu_clang10_opt $TREEDEPTH >> cpu_clang_opt_output10.txt
./cpu_clang10_fast_opt $TREEDEPTH >> cpu_clang_unsafe_opt_output10.txt
./cpu_clang_baseline11 $TREEDEPTH >> cpu_no_opt_clang_output11.txt
./cpu_clang11_opt $TREEDEPTH >> cpu_clang_opt_output11.txt
./cpu_clang11_fast_opt $TREEDEPTH >> cpu_clang_unsafe_opt_output11.txt
./cpu_clang_baseline12 $TREEDEPTH >> cpu_no_opt_clang_output12.txt
./cpu_clang12_opt $TREEDEPTH >> cpu_clang_opt_output12.txt
./cpu_clang12_fast_opt $TREEDEPTH >> cpu_clang_unsafe_opt_output12.txt
./cpu_clang_baseline13 $TREEDEPTH >> cpu_no_opt_clang_output13.txt
./cpu_clang13_opt $TREEDEPTH >> cpu_clang_opt_output13.txt
./cpu_clang13_fast_opt $TREEDEPTH >> cpu_clang_unsafe_opt_output13.txt

echo "Now run ./results_clang"
echo""
#Copyright Felix C. LeClair
