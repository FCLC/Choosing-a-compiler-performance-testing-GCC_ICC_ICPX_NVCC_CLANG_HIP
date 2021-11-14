#!/bin/bash
echo "Full results:"
echo""
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

echo "Results of CPU UNSAFE ICPX optimized:"
cat cpu_icpx_unsafe_opt_output.txt
# | grep 'Time taken by'
echo ""
