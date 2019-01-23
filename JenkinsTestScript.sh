#!/bin/sh -xe
rm -rf build
mkdir build
cd build
cmake ../
make
./test
