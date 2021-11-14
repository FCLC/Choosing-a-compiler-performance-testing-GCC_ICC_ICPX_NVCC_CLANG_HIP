#!/bin/bash
echo "Starting compile of baseline, opt and no opt"
echo ""

clang++-7 source_cpu_baseline.cpp -o cpu_clang_baseline7 -g 
echo "Finished CPU with clang-7 baseline"

clang++-7 -O3 -march=native source_cpu_baseline.cpp -o cpu_clang7_opt -funroll-loops
echo "Finished CPU with safe clang-7 opt"

clang++-7 -Ofast -march=native source_cpu_baseline.cpp -o cpu_clang7_fast_opt -funroll-loops
echo "Finished CPU with UNSAFE clang-7 opt"

clang++-8 source_cpu_baseline.cpp -o cpu_clang_baseline8 -g 
echo "Finished CPU with clang-8 baseline"

clang++-8 -O3 -march=native source_cpu_baseline.cpp -o cpu_clang8_opt -funroll-loops
echo "Finished CPU with safe clang-8 opt"

clang++-8 -Ofast -march=native source_cpu_baseline.cpp -o cpu_clang8_fast_opt -funroll-loops
echo "Finished CPU with UNSAFE clang-8 opt"

clang++-9 source_cpu_baseline.cpp -o cpu_clang_baseline9 -g 
echo "Finished CPU with clang-9 baseline"

clang++-9 -O3 -march=native source_cpu_baseline.cpp -o cpu_clang9_opt -funroll-loops
echo "Finished CPU with safe clang-9 opt"

clang++-9 -Ofast -march=native source_cpu_baseline.cpp -o cpu_clang9_fast_opt -funroll-loops
echo "Finished CPU with UNSAFE clang-9 opt"

clang++-10 source_cpu_baseline.cpp -o cpu_clang_baseline10 -g 
echo "Finished CPU with clang-10 baseline"

clang++-10 -O3 -march=native source_cpu_baseline.cpp -o cpu_clang10_opt -funroll-loops
echo "Finished CPU with safe clang-10 opt"

clang++-10 -Ofast -march=native source_cpu_baseline.cpp -o cpu_clang10_fast_opt -funroll-loops
echo "Finished CPU with UNSAFE clang-10 opt"

clang++-11 source_cpu_baseline.cpp -o cpu_clang_baseline11 -g 
echo "Finished CPU with clang-11 baseline"

clang++-11 -O3 -march=native source_cpu_baseline.cpp -o cpu_clang11_opt -funroll-loops
echo "Finished CPU with safe clang-11 opt"

clang++-11 -Ofast -march=native source_cpu_baseline.cpp -o cpu_clang11_fast_opt -funroll-loops
echo "Finished CPU with UNSAFE clang-11 opt"

clang++-12 source_cpu_baseline.cpp -o cpu_clang_baseline12 -g 
echo "Finished CPU with clang-12 baseline"

clang++-12 -O3 -march=native source_cpu_baseline.cpp -o cpu_clang12_opt -funroll-loops 
echo "Finished CPU with safe clang-12 opt"

clang++-12 -Ofast -march=native source_cpu_baseline.cpp -o cpu_clang12_fast_opt -funroll-loops -finline-functions
echo "Finished CPU with UNSAFE clang-12 opt"


echo ""
echo "Now run ./profile.sh to test differences"
