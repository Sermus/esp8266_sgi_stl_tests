#include <cpp_routines.h>
#include "stl_test.h"
extern "C"
{
#include <esp_common.h>
}

extern "C" void user_init(void)
{
    do_global_ctors();
    stl_main(1, NULL);
}
