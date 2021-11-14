echo "Clang 11"
./cpu_integer_clang11_opt
echo "GCC 9"
./cpu_integer_gcc9_fast_opt
echo "intel"
./cpu_integer_icc_opt
echo "DPCPP"
./cpu_integer_dpcpp_block_128_opt
echo "DPCPP"
./cpu_integer_dpcpp_block_512_opt
echo "NVCC"
./gpu_opt_integer
