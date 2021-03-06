    #include <iostream>
    #include <math.h>
    #include <chrono>     
    #include <algorithm>

	using namespace std;
	using namespace std::chrono;





    // CUDA kernel to add elements of two arrays
    __global__
    void add(int n, int *x, int *y)
    {
      int index = blockIdx.x * blockDim.x + threadIdx.x;
      int stride = blockDim.x * gridDim.x;
      for (int i = index; i < n; i += stride)
        y[i] = x[i] + y[i];
    }
     
    int main(void)
    {

  

	std::chrono::time_point<std::chrono::system_clock> start,stop;
	start = std::chrono::system_clock::now();;
	
	int count = 64;

	while (count > 0){ 

	int N = 1<<27;
      	int *x, *y;
     
      // Allocate Unified Memory -- accessible from CPU or GPU
      cudaMallocManaged(&x, N*sizeof(int));
      cudaMallocManaged(&y, N*sizeof(int));
     
      // initialize x and y arrays on the host
      for (int i = 0; i < N; i++) {
        x[i] = 1.0f;
        y[i] = 2.0f;
      }

      // Launch kernel on 1M elements on the GPU
      int blockSize = 256;
      int numBlocks = (N + blockSize - 1) / blockSize;
      add<<<numBlocks, blockSize>>>(N, x, y);

      // Wait for GPU to finish before accessing on host
      cudaDeviceSynchronize();

/*      // Check for errors (all values should be 3.0f)
      float maxError = 0.0f;
      for (int i = 0; i < N; i++)
        maxError = fmax(maxError, fabs(y[i]-3.0f));

	if(count<2){	std::cout << "Max error: " << maxError << std::endl;}
*/
      // Free memory
      cudaFree(x);
      cudaFree(y);

	count--;
	}
	stop = std::chrono::system_clock::now();


	std::chrono::duration<double> elapsed_seconds = stop - start;


	cout << "	Time taken by program:		 " << elapsed_seconds.count() << "s\n";

	 return 0;
    }
