#!/bin/bash
echo "Now profiling NVCC"
#echo "Full results are in baseline.txt, no_opt.txt and opt.txt for the respective programs"
#echo "Below is a simplifed output of the primary statistics"
#echo ""
#echo "If no results are printed, assume the program(s) errored out"

rm  gpu_no_opt_output.txt gpu_opt_output.txt  gpu_opt_unsafe_output.txt  2>/dev/null

#echo "Now NVCC GPU."
echo "Currently we profile:  gpu +/- compiler opt, gpu with device side init +/- compiler opt"
echo "This may take a while"
#echo "We'll let you know when we've finished the cpu portion"

#nvprof -f --log-file no_opt.txt 
./gpu_opt_no_compiler_opt >> gpu_no_opt_output.txt

#nvprof -f --log-file opt.txt
./gpu_opt>> gpu_opt_output.txt

#nvprof -f --log-file opt.txt 
./gpu_unsafe_opt>> gpu_opt_unsafe_output.txt

