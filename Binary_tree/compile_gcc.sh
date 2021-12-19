#!/bin/bash
echo "Starting compile of baseline, opt and no opt"
echo ""

gcc-7 binarytrees.c -o cpu_gcc_baseline7 -g -fno-tree-loop-optimize -fno-aggressive-loop-optimizations -fno-early-inlining -lm
echo "Finished CPU with GCC-7 baseline"

gcc-7 -O3 -march=native binarytrees.c -o cpu_gcc7_opt -lm
echo "Finished CPU with safe GCC-7 opt"

gcc-7 -Ofast -march=native binarytrees.c -o cpu_gcc7_fast_opt -lm $LegacyCflags
echo "Finished CPU with UNSAFE GCC-7 opt"

gcc-8 binarytrees.c -o cpu_gcc_baseline8 -g -fno-tree-loop-optimize -fno-aggressive-loop-optimizations -fno-early-inlining -lm
echo "Finished CPU with GCC-8 baseline"

gcc-8 -O3 -march=native binarytrees.c -o cpu_gcc8_opt -lm
echo "Finished CPU with safe GCC-8 opt"

gcc-8 -Ofast -march=native binarytrees.c -o cpu_gcc8_fast_opt -lm $OldCflags
echo "Finished CPU with UNSAFE GCC-8 opt"

gcc-9 binarytrees.c -o cpu_gcc_baseline9 -g -fno-tree-loop-optimize -fno-aggressive-loop-optimizations -fno-early-inlining -lm
echo "Finished CPU with GCC-9 baseline"

gcc-9 -O3 -march=native binarytrees.c -o cpu_gcc9_opt  -lm
echo "Finished CPU with safe GCC-9 opt"

gcc-9 -Ofast -march=native binarytrees.c -o cpu_gcc9_fast_opt -lm $OldCflags
echo "Finished CPU with UNSAFE GCC-9 opt"

gcc-10 binarytrees.c -o cpu_gcc_baseline10 -g -fno-tree-loop-optimize -fno-aggressive-loop-optimizations -fno-early-inlining -lm
echo "Finished CPU with GCC-10 baseline"

gcc-10 -O3 -march=native binarytrees.c -o cpu_gcc10_opt -lm
echo "Finished CPU with safe GCC-10 opt"

gcc-10 -Ofast -march=native binarytrees.c -o cpu_gcc10_fast_opt -lm $CFLAGS
echo "Finished CPU with UNSAFE GCC-10 opt"

gcc-11 binarytrees.c -o cpu_gcc_baseline11 -g -fno-tree-loop-optimize -fno-aggressive-loop-optimizations -fno-early-inlining -lm
echo "Finished CPU with GCC-11 baseline"

gcc-11 -O3 -march=native binarytrees.c -o cpu_gcc11_opt -lm
echo "Finished CPU with safe GCC-11 opt"

gcc-11 -Ofast -march=native binarytrees.c -o cpu_gcc11_fast_opt -lm $CFLAGS
echo "Finished CPU with UNSAFE GCC-11 opt"

gcc-12 binarytrees.c -o cpu_gcc_baseline12 -g -fno-tree-loop-optimize -fno-aggressive-loop-optimizations -fno-early-inlining -lm
echo "Finished CPU with GCC-12 baseline"

gcc-12 -O3 -march=native binarytrees.c -o cpu_gcc12_opt -lm
echo "Finished CPU with safe GCC-12 opt"

gcc-12 -Ofast -march=native binarytrees.c -o cpu_gcc12_fast_opt -lm $CFLAGS
echo "Finished CPU with UNSAFE GCC-12 opt"


echo ""
echo "Now run ./profile_gcc.sh to test differences"
#Copyright Felix C. LeClair
