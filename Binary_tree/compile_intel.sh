 #!/bin/bash
echo "Starting compile of baseline, opt and no opt"

echo ""
icc -O0 binarytrees.c -o ./cpu_icc_baseline
echo "Finished CPU with ICC baseline"

icc -O3 -march=native binarytrees.c -o cpu_icc_opt -unroll-aggressive
echo "Finished CPU with safe ICC opt"

icc -Ofast -march=native binarytrees.c -o cpu_icc_fast_opt -unroll-aggressive -funroll-loops -finline-functions -ipo $CFLAGS
echo "Finished CPU with UNSAFE ICC opt"

echo ""
icx  -O0 binarytrees.c -o cpu_icpx_baseline
echo "Finished CPU with ICPX baseline"

icx -O3 -march=native -unroll binarytrees.c -o cpu_icpx_opt
echo "Finished CPU with safe ICPX opt"

icx -O3 -march=native -unroll binarytrees.c -o cpu_icpx_unsafe_opt -funroll-loops -finline-functions -ipo  -fp-model=fast $CFLAGS
echo "Finished CPU with UNSAFE ICPX opt"

#Copyright Felix C. LeClair
