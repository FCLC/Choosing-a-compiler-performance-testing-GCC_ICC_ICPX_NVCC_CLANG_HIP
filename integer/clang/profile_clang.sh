#!/bin/bash
echo "Now profiling clang 7 to 12"
#echo "Full results are in baseline.txt, no_opt_clang.txt and opt.txt for the respective programs"
#echo "Below is a simplifed output of the primary statistics"
#echo ""
#echo "If no results are printed, assume the program(s) errored out"

rm cpu_integer_no_opt_clang_output7.txt cpu_integer_clang_opt_output7.txt cpu_integer_clang_unsafe_opt_output7.txt cpu_integer_no_opt_clang_output8.txt cpu_integer_clang_opt_output8.txt cpu_integer_clang_unsafe_opt_output8.txt cpu_integer_no_opt_clang_output9.txt cpu_integer_clang_opt_output9.txt cpu_integer_clang_unsafe_opt_output9.txt cpu_integer_no_opt_clang_output10.txt cpu_integer_clang_opt_output10.txt cpu_integer_clang_unsafe_opt_output10.tx cpu_integer_no_opt_clang_output11.txt cpu_integer_clang_opt_output11.txt cpu_integer_clang_unsafe_opt_output11.tx cpu_integer_no_opt_clang_output12.txt cpu_integer_clang_opt_output12.txt cpu_integer_clang_unsafe_opt_output12.txt 2>/dev/null

#echo "Now profiling clang"
echo "Currently we profile: clang +/- compiler opt and UNSAFE compiler opt"
#echo "This may take a while"
#echo "We'll let you know when we've finished the cpu portion"

./cpu_integer_clang_baseline7 >> cpu_integer_no_opt_clang_output7.txt
./cpu_integer_clang7_opt >> cpu_integer_clang_opt_output7.txt
./cpu_integer_clang7_fast_opt >> cpu_integer_clang_unsafe_opt_output7.txt
./cpu_integer_clang_baseline8 >> cpu_integer_no_opt_clang_output8.txt
./cpu_integer_clang8_opt >> cpu_integer_clang_opt_output8.txt
./cpu_integer_clang8_fast_opt >> cpu_integer_clang_unsafe_opt_output8.txt
./cpu_integer_clang_baseline9 >> cpu_integer_no_opt_clang_output9.txt
./cpu_integer_clang9_opt >> cpu_integer_clang_opt_output9.txt
./cpu_integer_clang9_fast_opt >> cpu_integer_clang_unsafe_opt_output9.txt
./cpu_integer_clang_baseline10 >> cpu_integer_no_opt_clang_output10.txt
./cpu_integer_clang10_opt >> cpu_integer_clang_opt_output10.txt
./cpu_integer_clang10_fast_opt >> cpu_integer_clang_unsafe_opt_output10.txt
./cpu_integer_clang_baseline11 >> cpu_integer_no_opt_clang_output11.txt
./cpu_integer_clang11_opt >> cpu_integer_clang_opt_output11.txt
./cpu_integer_clang11_fast_opt >> cpu_integer_clang_unsafe_opt_output11.txt
./cpu_integer_clang_baseline12 >> cpu_integer_no_opt_clang_output12.txt
./cpu_integer_clang12_opt >> cpu_integer_clang_opt_output12.txt
./cpu_integer_clang12_fast_opt >> cpu_integer_clang_unsafe_opt_output12.txt

echo "Now run ./results_clang"
echo""
