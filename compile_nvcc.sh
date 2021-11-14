#!/bin/bash
echo "Starting compile of baseline +/- opt and device side init +/- opt"

echo ""
nvcc -O0 -Xcicc -O0 -Xptxas -O0 source_gpu_baseline.cu -o gpu_baseline
echo "Finished GPU baseline"

nvcc -O3 -arch=sm_32 source_gpu_baseline.cu --use_fast_math -o gpu_baseline_with_compiler_opt
echo "Finished GPU baseline with compiler opt"

nvcc -O0 -Xcicc -O0 -Xptxas -O0 source_gpu_optimized.cu -o gpu_opt_no_compiler_opt 
echo "Finished GPU with device init no compiler opt"

nvcc -O3 -arch=sm_32 source_gpu_optimized.cu --use_fast_math -o gpu_opt
echo "Finished GPU with device init and UNSAFE compiler opt"

echo ""
echo "Now run ./profile_nvcc.sh to test differences"
