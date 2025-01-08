cmake_minimum_required(VERSION 3.13)

include($ENV{PICO_SDK_PATH}/pico_sdk_init.cmake)

project(my_project)

pico_sdk_init()

add_executable(my_project
    main.cpp
)

pico_enable_stdio_usb(my_project 1)
pico_enable_stdio_uart(my_project 0)

target_link_libraries(my_project pico_stdlib)

# Create map/bin/hex/uf2 files
pico_add_extra_outputs(my_project)
