#!/bin/bash
echo "Now profiling ICPC and ICPX"
#echo "Full results are in baseline.txt, no_opt.txt and opt.txt for the respective programs"
#echo "Below is a simplifed output of the primary statistics"
#echo ""
#echo "If no results are printed, assume the program(s) errored out"

rm cpu_integer_icc_opt_output.txt cpu_integer_icc_unsafe_opt_output.txt cpu_integer_icc_baseline_output.txt cpu_integer_icpx_unsafe_opt_output.txt cpu_integer_icpx_baseline_output.txt cpu_integer_icpx_opt_output.txt 2>/dev/null

#echo "Now profiling"
echo "Currently we profile: ICP(C/X) +/- compiler opt and UNSAFE compiler opt"
echo "This may take a while"
#echo "We'll let you know when we've finished the cpu portion"


./cpu_integer_icc_opt >> cpu_integer_icc_opt_output.txt
./cpu_integer_icc_baseline >> cpu_integer_icc_baseline_output.txt
./cpu_integer_icc_fast_opt >> cpu_integer_icc_unsafe_opt_output.txt

./cpu_integer_icpx_opt >> cpu_integer_icpx_opt_output.txt
./cpu_integer_icpx_baseline >> cpu_integer_icpx_baseline_output.txt
./cpu_integer_icpx_unsafe_opt  >> cpu_integer_icpx_unsafe_opt_output.txt
 
echo ""
echo "Now run ./results_intel"

