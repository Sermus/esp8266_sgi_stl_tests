#ifndef SINGLE
//  An adapted ObjectSpace example for use with SGI STL

#include <algorithm>
#include <iostream>
#include <numeric>
#include <string>

#ifdef MAIN 
#define inrprod0_test main
#endif
#endif
int inrprod0_test(int, char**)
{
  std::cout<<"Results of inrprod0_test:"<<std::endl;
int vector1[5] = { 1, 2, 3, 4, 5 };
int vector2[5] = { 1, 2, 3, 4, 5 };

  int result;
  result = std::inner_product(vector1, vector1 + 5, vector2, 0);
  std::cout << "Inner product = " << result << std::endl;
  return 0;
}
