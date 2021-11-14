#!/bin/bash
echo "Starting compile of baseline, opt and no opt"

echo ""
icc -O0 source_cpu_baseline.cpp -o ./cpu_icc_baseline
echo "Finished CPU with ICC baseline"

icc -O3 -march=native source_cpu_baseline.cpp -o cpu_icc_opt -unroll-aggressive
echo "Finished CPU with safe ICC opt"

icc -Ofast -march=native source_cpu_baseline.cpp -o cpu_icc_fast_opt -unroll-aggressive -funroll-loops -finline-functions -ipo
echo "Finished CPU with UNSAFE ICC opt"

echo ""
icpx  -O0 source_cpu_baseline.cpp -o cpu_icpx_baseline
echo "Finished CPU with ICPX baseline"

icpx -O3 -march=native -unroll source_cpu_baseline.cpp -o cpu_icpx_opt
echo "Finished CPU with safe ICPX opt"

icpx -O3 -march=native -unroll source_cpu_baseline.cpp -o cpu_icpx_unsafe_opt -funroll-loops -finline-functions -ipo  -fp-model=fast
echo "Finished CPU with UNSAFE ICPX opt"

