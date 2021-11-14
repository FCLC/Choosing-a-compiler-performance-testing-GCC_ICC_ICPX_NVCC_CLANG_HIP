#!/bin/bash
##GPU RESULTS
echo "Full results:"
echo ""
echo "Results of gpu baseline:"
#cat gpu_baseline_output_integer.txt | grep 'Time taken by'
cat gpu_baseline_output_integer.txt

echo ""
echo "Results of gpu baseline with normal compiler opt:"
#cat gpu_baseline_with_compiler_opt_output_integer.txt | grep 'Time taken by'
cat gpu_baseline_with_normal_compiler_opt_output_integer.txt

echo ""
echo "Results of gpu baseline with andvanced compiler opt:"
#cat gpu_baseline_with_compiler_opt_output_integer.txt | grep 'Time taken by'
cat gpu_baseline_with_compiler_opt_output_integer.txt

echo ""
echo "Results of gpu_no_compiler_opt:"
#cat gpu_no_opt_output_integer.txt | grep 'Time taken by'
cat gpu_no_opt_output_integer.txt

echo ""
echo "Results of GPU full normal opt:"
#cat gpu_opt_output_integer.txt | grep 'Time taken by'
cat gpu_with_normal_opt_output_integer.txt

echo ""
echo "Results of GPU full opt:"
#cat gpu_opt_output_integer.txt | grep 'Time taken by'
cat gpu_opt_output_integer.txt
