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
cd ..
cp build/test docker/testFolder
cp testing/expected.log docker/testFolder

# Run
##############################
cd docker
docker build -t dockertest .
docker run dockertest ./startup.sh
#docker run -ti dockertest


# Post Run
##############################

