#include <iostream>
#include <math.h>
#include <chrono>
#include <algorithm>

        using namespace std;
        using namespace std::chrono;

// function to add the elements of two arrays
void add(int n, float *x, float *y)
{
  for (int i = 0; i < n; i++)
      y[i] = x[i] + y[i];
}

int main(void)
{

std::chrono::time_point<std::chrono::system_clock> start,stop;
        start = std::chrono::system_clock::now();;


  int N = 1<<27; 

 int count = 64;


while (count > 0){
  float *x = new float[N];
  float *y = new float[N];

  // initialize x and y arrays on the host
  for (int i = 0; i < N; i++) {
    x[i] = 1.0f;
    y[i] = 2.0f;
  }

  // Run kernel on 1M elements on the CPU
  add(N, x, y);

  // Check for errors (all values should be 3.0f)
  float maxError = 0.0f;
  for (int i = 0; i < N; i++)
    maxError = fmax(maxError, fabs(y[i]-3.0f));
if (count<2){  std::cout << "Max error: " << maxError << std::endl;}


  // Free memory
  delete [] x;
  delete [] y;
	count--;}

	stop = std::chrono::system_clock::now();
	std::chrono::duration<double> elapsed_seconds = stop - start;
	cout << "	Time taken by function:		 " << elapsed_seconds.count() << "s\n";

  return 0;
}
