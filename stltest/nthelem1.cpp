#ifndef SINGLE
//  An adapted ObjectSpace example for use with SGI STL

#include <iterator>
#include <algorithm>
#include <iostream>
#include <vector>
#include <cstdlib>

#ifdef MAIN 
#define nthelem1_test main
#endif
#endif
int nthelem1_test(int, char**)
{
  std::cout<<"Results of nthelem1_test:"<<std::endl;
  std::vector <int> v1(10);
  for(int i = 0; i < v1.size(); i++)
    v1[i] = std::rand() % 10;
  std::ostream_iterator<int> iter(std::cout, " ");
  std::copy(v1.begin(), v1.end(), iter);
  std::cout << std::endl;
  std::nth_element(v1.begin(),
               v1.begin() + v1.size() / 2,
               v1.end());
  std::copy(v1.begin(), v1.end(), iter);
  std::cout << std::endl;
  return 0;
}
