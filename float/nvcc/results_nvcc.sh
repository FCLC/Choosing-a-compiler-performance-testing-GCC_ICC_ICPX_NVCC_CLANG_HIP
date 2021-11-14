#!/bin/bash
##GPU RESULTS
echo "Full results:"


echo ""
echo "Results of GPU no compiler opt:"
#cat gpu_no_opt_output.txt | grep 'Time taken by'
cat gpu_no_opt_output.txt

echo ""
echo "Results of GPU opt:"
#cat gpu_opt_output.txt | grep 'Time taken by'
cat gpu_opt_output.txt

echo ""
echo "Results of GPU UNSAFE opt:"
#cat gpu_opt_output.txt | grep 'Time taken by'
cat gpu_opt_unsafe_output.txt
