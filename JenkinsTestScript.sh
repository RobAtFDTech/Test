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
dockerImage=dockertest
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
for index in `seq 1 1`;
do
	docker run $dockerImage ./startup.sh $index &
	if [ $? -eq 0 ]
	then
		echo "docker run $dockerImage::$index started OK"
	else
		echo "docker run $$dockerImage::$index reported a failure"
		result=1
	fi
done

while :
do	
	if [ ! "$(docker ps -q -f name=$dockerImage)" ]; then
		echo "docker run complete"
		break
	fi
	sleep 0.5
done 

# Post Run
##############################





echo "End Script"
exit $result



