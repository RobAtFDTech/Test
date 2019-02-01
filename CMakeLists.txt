cmake_minimum_required(VERSION 3.0)
project(test)

set (CMAKE_CXX_STANDARD 14)
set (Wall)
set (W1)
set (Wfloat-conversion)

file(GLOB SOURCES
    main.cpp)

add_executable(test ${SOURCES} )
target_compile_options(test PUBLIC)

