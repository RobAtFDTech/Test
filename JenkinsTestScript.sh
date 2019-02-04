#!/bin/sh 
result=0
# Build application
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

# Build docker image
##############################
cd docker
dockerArg="first"
dockerImage=dockertest_$dockerArg
docker build --build-arg test=$dockerArg -t $dockerImage .
if [ $? -eq 0 ]
then
	echo "docker build $dockerImage returned OK"
else
	echo "docker build $dockerImage reported a failure"
	result=1
fi

# Run
##############################

docker run $dockerImage ./startup.sh
if [ $? -eq 0 ]
then
	echo "docker run $dockerImage returned OK"
else
	echo "docker run $dockerImage reported a failure"
	result=1
fi

# Post Run
##############################

exit $result
