#ifndef SINGLE
//  An adapted ObjectSpace example for use with SGI STL

#include <vector>
#include <algorithm>
#include <iostream>
#include <functional>
#include <iterator>

#ifdef MAIN 
#define inplmrg2_test main
#endif
#endif
int inplmrg2_test(int, char**)
{
  std::cout<<"Results of inplmrg2_test:"<<std::endl;
  std::vector <int> v1(10);
  for(int i = 0; i < v1.size(); i++)
    v1[i] =(v1.size() - i - 1) % 5;
  std::ostream_iterator <int> iter(std::cout, " ");
  std::copy(v1.begin(), v1.end(), iter);
  std::cout << std::endl;
  std::inplace_merge(v1.begin(), v1.begin() + 5,
                 v1.end(),
                 std::greater<int>());
  std::copy(v1.begin(), v1.end(), iter);
  std::cout << std::endl;
  return 0;
}
