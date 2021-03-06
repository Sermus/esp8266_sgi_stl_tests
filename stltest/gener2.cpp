#ifndef SINGLE
//  An adapted ObjectSpace example for use with SGI STL

#include <vector>
#include <algorithm>
#include <iostream>
#include <iterator>
#include "fib.h"

#ifdef MAIN 
#define gener2_test main
#endif
#endif

int gener2_test(int, char**)
{
  std::cout<<"Results of gener2_test:"<<std::endl;
  std::vector <int> v1(10);
  Fibonacci generator;
  std::generate(v1.begin(), v1.end(), generator);
  std::ostream_iterator<int> iter(std::cout, " ");
  std::copy(v1.begin(), v1.end(), iter);
  std::cout << std::endl;
  return 0;
}
