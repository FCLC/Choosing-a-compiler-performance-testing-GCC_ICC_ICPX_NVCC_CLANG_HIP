    #include <iostream>
    #include <math.h>
    #include <chrono>
    #include <algorithm>
    #include "cuda.h"
    #include "cuda_fp16.h"
    

        using namespace std;
        using namespace std::chrono;


    // CUDA kernel to add elements of two arrays
 __global__
    void add(int n, float*x, float*y)
    {
      int index = blockIdx.x * blockDim.x + threadIdx.x;
      int stride = blockDim.x * gridDim.x;
//	 for (int i = index; i < n; i += stride)
//	y[i] = __device__ ​ __half __hadd ( const __half x[i], const __half y[i] ) ;  

	 for (int i = index; i < n; i += stride)
		 y[i] = x[i] + y[i];
    }


__global__
	void init(int n, float*x, float*y) 
{
  	int index = threadIdx.x + blockIdx.x * blockDim.x;
  	int stride = blockDim.x * gridDim.x;
	for (int i = index; i < n; i += stride) 
	{
    		x[i] = 1.0f;
    		y[i] = 2.0f;
  	}
}     




    int main(void)
    {

	//Start counting

	std::chrono::time_point<std::chrono::system_clock> start,stop;
        start = std::chrono::system_clock::now();;

	int count =64;

	while (count >0){
      int N = 1<<27;
	 float *x, *y;
     
      // Allocate Unified Memory -- accessible from CPU or GPU
      cudaMallocManaged(&x, N*sizeof(float));
      cudaMallocManaged(&y, N*sizeof(float));
     
      
//define Blocks and strides
	int blockSize = 256;
	int numBlocks = (N + blockSize - 1) / blockSize;


// initialize x and y arrays on the host


	init<<<numBlocks, blockSize>>>(N,x,y);

     
      // Launch kernel on 1M elements on the GPU
      
	add<<<numBlocks, blockSize>>>(N, x, y);
     
      // Wait for GPU to finish before accessing on host
	cudaDeviceSynchronize();

      // Check for errors (all values should be 3.0f)
      float maxError = 0.0f;
      for (int i = 0; i < N; i++)
	maxError = fmax(maxError, fabs(y[i]-3.0f));
	if(count<2){    std::cout << "Max error: " << maxError << std::endl;}
     
      // Free memory
      cudaFree(x);
      cudaFree(y);
	count--;
	}
     // calculate and output time 
	stop = std::chrono::system_clock::now();
        std::chrono::duration<float> elapsed_seconds = stop - start;

//	std::cout << "Max error: " << maxError << std::endl;

        cout << "	Time taken by program:		 " << elapsed_seconds.count() << "s\n";
      return 0;
    }
