#!/bin/bash
echo "Now profiling NVCC"
#echo "Full results are in baseline_integer.txt, no_opt_integer.txt and opt_integer.txt for the respective programs"
#echo "Below is a simplifed output of the primary statistics"
#echo ""
#echo "If no results are printed, assume the program(s) errored out"

rm  gpu_baseline_output_integer.txt gpu_baseline_with_compiler_opt_output_integer.txt gpu_no_opt_output_integer.txt gpu_opt_output_integer.txt  2>/dev/null

#echo "Now NVCC GPU."
echo "Currently we profile:  gpu +/- compiler opt, gpu with device side init +/- compiler opt"
echo "This may take a while"
#echo "We'll let you know when we've finished the cpu portion"


#nvprof -f --log-file baseline_integer.txt 
./gpu_baseline_integer >> gpu_baseline_output_integer.txt

#nvprof -f --log-file baseline_integer.txt 
./gpu_baseline_with_normal_compiler_opt_integer >> gpu_baseline_with_normal_compiler_opt_output_integer.txt

#nvprof -f --log-file baseline_integer.txt 
./gpu_baseline_with_compiler_opt_integer >> gpu_baseline_with_compiler_opt_output_integer.txt

#nvprof -f --log-file no_opt_integer.txt 
./gpu_opt_no_compiler_opt_integer >> gpu_no_opt_output_integer.txt

#nvprof -f --log-file opt_integer.txt 
./gpu_with_normal_opt_integer >> gpu_with_normal_opt_output_integer.txt

#nvprof -f --log-file opt_integer.txt 
./gpu_opt_integer >> gpu_opt_output_integer.txt

