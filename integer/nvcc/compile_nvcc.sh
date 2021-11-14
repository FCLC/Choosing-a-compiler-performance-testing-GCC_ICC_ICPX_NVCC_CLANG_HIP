#!/bin/bash
echo "Starting compile of baseline +/- opt and device side init +/- opt"

echo ""
nvcc -O0 -Xcicc -O0 -Xptxas -O0 source_gpu_baseline_integer.cu -o gpu_baseline_integer
echo "Finished GPU baseline"

nvcc -O3 source_gpu_baseline_integer.cu -o gpu_baseline_with_normal_compiler_opt_integer
echo "Finished GPU baseline with compiler opt"

nvcc -O3 -arch=sm_32 source_gpu_baseline_integer.cu --use_fast_math -o gpu_baseline_with_compiler_opt_integer
echo "Finished GPU baseline with advanced compiler opt"

nvcc -O0 -Xcicc -O0 -Xptxas -O0 source_gpu_optimized_integer.cu -o gpu_opt_no_compiler_opt_integer
echo "Finished GPU with device init no compiler opt"

nvcc -O3  source_gpu_optimized_integer.cu  -o gpu_with_normal_opt_integer
echo "Finished GPU with device init and compiler opt"


nvcc -O3 -arch=sm_32 source_gpu_optimized_integer.cu --use_fast_math -o gpu_opt_integer
echo "Finished GPU with device init and andvanced/unsafe compiler opt"

echo ""
echo "Now run ./profile_nvcc.sh to test differences"


##use sm_[YOUR TARGET ARCH] to create more efficient code. it's similar to -march=[] in GCC/CLANG etc. but doesnt support "native"
