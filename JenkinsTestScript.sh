#!/bin/sh -x
result=0
# Build
##############################
rm -rf build
mkdir build
cd build
cmake ../
make
cd ..

# Deploy
##############################
deploy="docker/testFolder"
rm -rf $deploy
mkdir $deploy
cp build/test $deploy
cp testing/expected.log $deploy

# Run
##############################
cd docker
docker build -t dockertest .
#docker run -ti dockertest

docker run dockertest ./startup.sh
if [ $? -eq 0 ]
then
	echo "docker script returned OK"
else
	echo "docker script reported a failure, return: $?"
	return=$?
fi

# Post Run
##############################





exit $return
