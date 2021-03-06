#ifndef SINGLE
//  An adapted ObjectSpace example for use with SGI STL

#include <algorithm>
#include <iostream>

#ifdef MAIN 
#define setsymd0_test main
#endif
#endif
int setsymd0_test(int, char**)
{
  std::cout<<"Results of setsymd0_test:"<<std::endl;
int v1[3] = { 13, 18, 23 };
int v2[4] = { 10, 13, 17, 23 };
int result[4] = { 0, 0, 0, 0 };

  std::set_symmetric_difference((int*)v1, (int*)v1 + 3, (int*)v2, (int*)v2 + 4, (int*)result);
  for(int i = 0; i < 4; i++)
    std::cout << result[i] << ' ';
  std::cout << std::endl;
  return 0;
}
