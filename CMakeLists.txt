cmake_minimum_required(VERSION 3.0)
project(TestApp)

set (CMAKE_CXX_STANDARD 14)
set (Wall)
set (W1)
set (Wfloat-conversion)

file(GLOB SOURCES
    main.cpp)

add_executable(TestApp ${SOURCES} )
target_compile_options(TestApp PUBLIC)

