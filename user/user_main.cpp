#include <cpp_routines.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include "stl_test.h"
extern "C"
{
#include <esp_common.h>
}

void test_task(void *pvParameters)
{
    os_printf("Test task\n");    
    stl_main(1, NULL);
    vTaskDelete(NULL);
}

extern "C" void user_init(void)
{
    do_global_ctors();
    os_printf("Creating test task\n");
    xTaskCreate(test_task, "test_task", 1024, NULL, 1, NULL);
}
