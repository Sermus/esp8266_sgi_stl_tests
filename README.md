# esp8266_sgi_stl_tests
The port of SGI STL tests to ESP8266

##Prerequisites
The tests require proper build environment with fully functional libc and libstdc++. Since the tests are quite a bit of code the size of target binary file is about 600KB which is not meant to fit into standard Espressif 512KB memory layout. For this reason OTA image for 32m-c1 memory map is used, therefore it requires 4MB flash.
