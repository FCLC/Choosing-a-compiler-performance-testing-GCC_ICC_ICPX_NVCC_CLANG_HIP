#!/bin/bash
echo "Now profiling"
echo "Full results are in baseline.txt, no_opt.txt and opt.txt for the respective programs"
echo "Below is a simplifed output of the primary statistics"
#echo ""
echo "If no results are printed, assume the program(s) errored out"

rm cpu_no_opt_output.txt cpu_icc_opt_output.txt cpu_gcc_opt_output.txt gpu_baseline_output.txt gpu_baseline_with_compiler_opt_output.txt gpu_no_opt_output.txt gpu_opt_output.txt cpu_gcc_unsafe_opt_output.txt cpu_icc_unsafe_opt_output.txt cpu_icc_baseline_output.txt cpu_icpx_baseline_output.txt cpu_icpx_opt_output.txt 2>/dev/null

echo "Now profiling CPU and GPU."
echo "Currently we profile: gcc +/- compiler opt, icc +/- compiler opt, icpx +/- compiler opt, gpu +/- compiler opt, gpu +/- compiler opt, gpu with device side init +/- compiler opt"
echo "This may take a while"
echo "We'll let you know when we've finished the cpu portion"

./cpu_baseline >> cpu_no_opt_output.txt
./cpu_gcc_opt >> cpu_gcc_opt_output.txt
./cpu_icc_opt >> cpu_icc_opt_output.txt
./cpu_icc_baseline >> cpu_icc_baseline_output.txt
./cpu_gcc_fast_opt >> cpu_gcc_unsafe_opt_output.txt
./cpu_icc_fast_opt >> cpu_icc_unsafe_opt_output.txt
./cpu_icpx_baseline >> cpu_icpx_baseline_output.txt
./cpu_icpx_opt  >> cpu_icpx_opt_output.txt
 

echo "Finished Testing CPU programs, now to GPU's" 


nvprof -f --log-file baseline.txt ./gpu_baseline >> gpu_baseline_output.txt

nvprof -f --log-file baseline.txt ./gpu_baseline_with_compiler_opt >> gpu_baseline_with_compiler_opt_output.txt

nvprof -f --log-file no_opt.txt ./gpu_opt_no_compiler_opt >> gpu_no_opt_output.txt

nvprof -f --log-file opt.txt ./gpu_opt>> gpu_opt_output.txt

echo "Full results:"
echo""
echo""

##CPU RESULTS

echo "Results of CPU GCC baseline:"
cat cpu_no_opt_output.txt 
#| grep 'Time taken by'
echo ""

echo "Results of CPU GCC optimized:"
cat cpu_gcc_opt_output.txt
# | grep 'Time taken by'
echo ""

echo "Results of CPU UNSAFE GCC optimized:"
cat cpu_gcc_unsafe_opt_output.txt
# | grep 'Time taken by'
echo ""

echo "Results of CPU ICC baseline:"
cat cpu_icc_baseline_output.txt
# | grep 'Time taken by'
echo ""

echo "Results of CPU ICC optimized:"
cat cpu_icc_opt_output.txt
# | grep 'Time taken by'
echo ""

echo "Results of CPU UNSAFE ICC optimized:"
cat cpu_icc_unsafe_opt_output.txt
# | grep 'Time taken by'
echo ""


echo "Results of CPU ICPX baseline:"
cat cpu_icpx_baseline_output.txt
# | grep 'Time taken by'
echo ""

echo "Results of CPU ICPX optimized:"
cat cpu_icpx_opt_output.txt
# | grep 'Time taken by'
echo ""


##GPU RESULTS

echo ""
echo "Results of gpu baseline:"
#cat gpu_baseline_output.txt | grep 'Time taken by'
cat gpu_baseline_output.txt

echo ""
echo "Results of gpu baseline with compiler opt:"
#cat gpu_baseline_with_compiler_opt_output.txt | grep 'Time taken by'
cat gpu_baseline_with_compiler_opt_output.txt

echo ""
echo "Results of gpu_no_compiler_opt:"
#cat gpu_no_opt_output.txt | grep 'Time taken by'
cat gpu_no_opt_output.txt

echo ""
echo "Results of GPU full opt:"
#cat gpu_opt_output.txt | grep 'Time taken by'
cat gpu_opt_output.txt


