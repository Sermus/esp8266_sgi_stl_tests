#ifdef GDBDEBUG
#include "gdbstub.h"
#endif
#include "routines.h"
#include "stl_test.h"
extern "C"
{
#include <user_interface.h>
#include <osapi.h>
#include "uart.h"
#include "espmissingincludes.h"
}

extern "C" void user_init(void)
{
    uart_init(BIT_RATE_115200, BIT_RATE_115200);
    do_global_ctors();
#ifdef GDBDEBUG
    gdbstub_init();
#endif
    stl_main(1, NULL);
}

extern "C" void user_rf_pre_init(void)
{
}

