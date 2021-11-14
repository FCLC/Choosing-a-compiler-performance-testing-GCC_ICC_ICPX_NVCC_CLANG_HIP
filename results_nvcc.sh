#!/bin/bash
##GPU RESULTS
echo "Full results:"
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
