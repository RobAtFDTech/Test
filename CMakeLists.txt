cmake_minimum_required(VERSION 3.0)
project(test)

file(GLOB source main.cpp)
add_executable(test ${source} )
target_compile_options(test PUBLIC -Wall -Wfloat-conversion)

