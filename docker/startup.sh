#!/bin/sh
#set -e

# Run the application
echo "Run application"
cd /testFolder
./test

# Compare the actual results to the expected results
echo "Compare results"
result=$(diff -y -W 72 test.log expected.log)
if [ $? -eq 0 ]
then
        echo "Compare is OK"
else
	echo "Compare is NOT OK"
        echo "$result"
fi
