#include <CL/sycl.hpp>
#include <dpct/dpct.hpp>
#include <iostream>
#include <math.h>
    #include <chrono>     
    #include <algorithm>

	using namespace std;
	using namespace std::chrono;





    // CUDA kernel to add elements of two arrays
    
    void add(int n, int *x, int *y, sycl::nd_item<3> item_ct1)
    {
      int index = item_ct1.get_group(2) * item_ct1.get_local_range().get(2) +
                  item_ct1.get_local_id(2);
      int stride =
          item_ct1.get_local_range().get(2) * item_ct1.get_group_range(2);
      for (int i = index; i < n; i += stride)
        y[i] = x[i] + y[i];
    }
     
    int main(void)
    {
      dpct::device_ext &dev_ct1 = dpct::get_current_device();
      sycl::queue &q_ct1 = dev_ct1.default_queue();

        std::chrono::time_point<std::chrono::system_clock> start,stop;
	start = std::chrono::system_clock::now();;
	
	int count = 64;

	while (count > 0){ 

	int N = 1<<27;
      	int *x, *y;
     
      // Allocate Unified Memory -- accessible from CPU or GPU
      x = sycl::malloc_shared<int>(N, q_ct1);
      y = sycl::malloc_shared<int>(N, q_ct1);

      // initialize x and y arrays on the host
      for (int i = 0; i < N; i++) {
        x[i] = 1.0f;
        y[i] = 2.0f;
      }

      // Launch kernel on 1M elements on the GPU
      int blockSize = 128;
      int numBlocks = (N + blockSize - 1) / blockSize;
      /*
      DPCT1049:0: The workgroup size passed to the SYCL kernel may exceed the
      limit. To get the device limit, query info::device::max_work_group_size.
      Adjust the workgroup size if needed.
      */
      q_ct1.parallel_for(sycl::nd_range<3>(sycl::range<3>(1, 1, numBlocks) *
                                               sycl::range<3>(1, 1, blockSize),
                                           sycl::range<3>(1, 1, blockSize)),
                         [=](sycl::nd_item<3> item_ct1) {
                            add(N, x, y, item_ct1);
                         });

      // Wait for GPU to finish before accessing on host
      dev_ct1.queues_wait_and_throw();

/*      // Check for errors (all values should be 3.0f)
      float maxError = 0.0f;
      for (int i = 0; i < N; i++)
        maxError = fmax(maxError, fabs(y[i]-3.0f));

	if(count<2){	std::cout << "Max error: " << maxError << std::endl;}
*/
      // Free memory
      sycl::free(x, q_ct1);
      sycl::free(y, q_ct1);

        count--;
	}
	stop = std::chrono::system_clock::now();


	std::chrono::duration<double> elapsed_seconds = stop - start;


	cout << "	Time taken by program:		 " << elapsed_seconds.count() << "s\n";

	 return 0;
    }
