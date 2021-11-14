#!/bin/bash
echo "Starting compile of baseline, opt and no opt"
echo ""

g++-7 source_cpu_baseline_integer.cpp -o cpu_integer_gcc_baseline7 -g -fno-tree-loop-optimize -fno-aggressive-loop-optimizations -fno-early-inlining
echo "Finished CPU with GCC-7 baseline"

g++-7 -O3 -march=native source_cpu_baseline_integer.cpp -o cpu_integer_gcc7_opt 
echo "Finished CPU with safe GCC-7 opt"

g++-7 -Ofast -march=native source_cpu_baseline_integer.cpp -o cpu_integer_gcc7_fast_opt 
echo "Finished CPU with UNSAFE GCC-7 opt"

g++-8 source_cpu_baseline_integer.cpp -o cpu_integer_gcc_baseline8 -g -fno-tree-loop-optimize -fno-aggressive-loop-optimizations -fno-early-inlining
echo "Finished CPU with GCC-8 baseline"

g++-8 -O3 -march=native source_cpu_baseline_integer.cpp -o cpu_integer_gcc8_opt 
echo "Finished CPU with safe GCC-8 opt"

g++-8 -Ofast -march=native source_cpu_baseline_integer.cpp -o cpu_integer_gcc8_fast_opt 
echo "Finished CPU with UNSAFE GCC-8 opt"

g++-9 source_cpu_baseline_integer.cpp -o cpu_integer_gcc_baseline9 -g -fno-tree-loop-optimize -fno-aggressive-loop-optimizations -fno-early-inlining
echo "Finished CPU with GCC-9 baseline"

g++-9 -O3 -march=native source_cpu_baseline_integer.cpp -o cpu_integer_gcc9_opt 
echo "Finished CPU with safe GCC-9 opt"

g++-9 -Ofast -march=native source_cpu_baseline_integer.cpp -o cpu_integer_gcc9_fast_opt 
echo "Finished CPU with UNSAFE GCC-9 opt"

g++-10 source_cpu_baseline_integer.cpp -o cpu_integer_gcc_baseline10 -g -fno-tree-loop-optimize -fno-aggressive-loop-optimizations -fno-early-inlining
echo "Finished CPU with GCC-10 baseline"

g++-10 -O3 -march=native source_cpu_baseline_integer.cpp -o cpu_integer_gcc10_opt 
echo "Finished CPU with safe GCC-10 opt"

g++-10 -Ofast -march=native source_cpu_baseline_integer.cpp -o cpu_integer_gcc10_fast_opt 
echo "Finished CPU with UNSAFE GCC-10 opt"


echo ""
echo "Now run ./profile_gcc.sh to test differences"
