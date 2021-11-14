#!/bin/bash
echo "Starting compile of +/- opt and UNSAFE opt"

nvcc -O0 -Xcicc -O0 -Xptxas -O0 source_gpu_optimized.cu -o gpu_opt_no_compiler_opt 
echo "Finished GPU with device init no compiler opt"

nvcc -O3 -arch=sm_30 source_gpu_optimized.cu -o gpu_opt
echo "Finished GPU with device init and compiler opt"

nvcc -O3 -arch=sm_30 source_gpu_optimized.cu --use_fast_math -o gpu_unsafe_opt
echo "Finished GPU with device init and UNSAFE compiler opt"

echo ""
echo "Now run ./profile_nvcc.sh to test differences"
