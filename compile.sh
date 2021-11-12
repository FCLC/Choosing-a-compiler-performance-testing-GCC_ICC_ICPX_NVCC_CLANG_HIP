#!/bin/bash
echo "Starting compile of baseline, opt and no opt"
echo ""

g++-9 source_cpu_baseline.cpp -o cpu_baseline -O0 -g -fno-tree-loop-optimize -fno-aggressive-loop-optimizations -fno-early-inlining
echo "Finished CPU with GCC baseline"

g++-9 -O3 -march=native source_cpu_baseline.cpp -o cpu_gcc_opt 
echo "Finished CPU with safe GCC opt"

g++-9 -Ofast -march=native source_cpu_baseline.cpp -o cpu_gcc_fast_opt 
echo "Finished CPU with UNSAFE GCC opt"

echo ""
icc -O0 source_cpu_baseline.cpp -o ./cpu_icc_baseline
echo "Finished CPU with ICC baseline"

icc -O3 -march=native source_cpu_baseline.cpp -o cpu_icc_opt -unroll-aggressive
echo "Finished CPU with safe ICC opt"

icc -Ofast -march=native source_cpu_baseline.cpp -o cpu_icc_fast_opt -unroll-aggressive
echo "Finished CPU with UNSAFE ICC opt"

echo ""
icpx -O0  source_cpu_baseline.cpp -o cpu_icpx_baseline
echo "Finished CPU with ICPX baseline"

icpx -O3 -march=native -unroll source_cpu_baseline.cpp -o cpu_icpx_opt
echo "Finished CPU with safe ICPX opt"

icpx -fast -march=native -unroll source_cpu_baseline.cpp -o cpu_icpx_unsafe_opt
echo "Finished CPU with UNSAFE ICPX opt"





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
echo "Now run ./profile.sh to test differences"
