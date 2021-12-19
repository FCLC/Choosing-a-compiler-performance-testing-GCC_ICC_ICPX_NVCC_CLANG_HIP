#!/bin/bash
echo "Starting compile of baseline, opt and no opt"
echo ""

clang-7 binarytrees.c -o cpu_clang_baseline7  -lm -g 
echo "Finished CPU with clang-7 baseline"

clang-7 -O3 -march=native binarytrees.c -o cpu_clang7_opt  -lm -funroll-loops
echo "Finished CPU with safe clang-7 opt"

clang-7 -Ofast -march=native binarytrees.c -o cpu_clang7_fast_opt -lm -funroll-loops
echo "Finished CPU with UNSAFE clang-7 opt"

clang-8 binarytrees.c -o cpu_clang_baseline8  -lm -g 
echo "Finished CPU with clang-8 baseline"

clang-8 -O3 -march=native binarytrees.c -o cpu_clang8_opt  -lm -funroll-loops
echo "Finished CPU with safe clang-8 opt"

clang-8 -Ofast -march=native binarytrees.c -o cpu_clang8_fast_opt  -lm -funroll-loops
echo "Finished CPU with UNSAFE clang-8 opt"

clang-9 binarytrees.c -o cpu_clang_baseline9 -lm -g 
echo "Finished CPU with clang-9 baseline"

clang-9 -O3 -march=native binarytrees.c -o cpu_clang9_opt -lm -funroll-loops
echo "Finished CPU with safe clang-9 opt"

clang-9 -Ofast -march=native binarytrees.c -o  -lm cpu_clang9_fast_opt -funroll-loops
echo "Finished CPU with UNSAFE clang-9 opt"

clang-10 binarytrees.c -o cpu_clang_baseline10  -lm -g 
echo "Finished CPU with clang-10 baseline"

clang-10 -O3 -march=native binarytrees.c -o cpu_clang10_opt -lm -funroll-loops -static 
echo "Finished CPU with safe clang-10 opt"

clang-10 -Ofast -march=native binarytrees.c -o cpu_clang10_fast_opt -lm -funroll-loops
echo "Finished CPU with UNSAFE clang-10 opt"

clang-11 binarytrees.c -o cpu_clang_baseline11  -lm -g 
echo "Finished CPU with clang-11 baseline"

clang-11 -O3 -march=native binarytrees.c -o cpu_clang11_opt -lm -funroll-loops
echo "Finished CPU with safe clang-11 opt"

clang-11 -Ofast -march=native binarytrees.c -o cpu_clang11_fast_opt -lm -funroll-loops
echo "Finished CPU with UNSAFE clang-11 opt"

clang-12 binarytrees.c -o cpu_clang_baseline12 -lm -g 
echo "Finished CPU with clang-12 baseline"

clang-12 -O3 -march=native binarytrees.c -o cpu_clang12_opt -lm -funroll-loops 
echo "Finished CPU with safe clang-12 opt"

clang-12 -Ofast -march=native binarytrees.c -o cpu_clang12_fast_opt -lm -funroll-loops -finline-functions
echo "Finished CPU with UNSAFE clang-12 opt"

clang-13 binarytrees.c -o cpu_clang_baseline13 -lm -g 
echo "Finished CPU with clang-13 baseline"

clang-13 -O3 -march=native binarytrees.c -o cpu_clang13_opt -lm -funroll-loops 
echo "Finished CPU with safe clang-13 opt"

clang-13 -Ofast -march=native binarytrees.c -o cpu_clang13_fast_opt -lm -funroll-loops -finline-functions
echo "Finished CPU with UNSAFE clang-13 opt"


echo ""
echo "Now run ./profile.sh to test differences"
#Copyright Felix C. LeClair
