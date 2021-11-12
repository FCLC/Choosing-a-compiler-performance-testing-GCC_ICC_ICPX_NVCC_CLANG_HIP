#!/bin/bash
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
