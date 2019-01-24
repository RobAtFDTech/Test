#!/bin/sh -xe

# Build
##############################
rm -rf build
mkdir build
cd build
cmake ../
make


# Deploy
##############################
cp test ../docker


# Run
##############################
cd ../docker
docker build -t dockertest .
docker run -ti dockertest ./startup.sh
