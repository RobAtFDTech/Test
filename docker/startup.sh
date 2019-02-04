#!/bin/sh
result=0

# Run the application
echo "Run application"
cd /testFolder
echo "### TESTED APPLICATION #####################################################################"
./test
echo "############################################################################################"
if [ $? -ne 0 ]
then
echo "Test application FAIL - exiting"
result=1
exit $result
fi

# Compare the actual results to the expected results
echo "Compare results"
diff=$(diff -y -W 72 test.log expected.log)
if [ $? -eq 0 ]
then
        echo "Compare is OK"
else
	echo "Compare is NOT OK"
	result=1
        echo "$diff"
	exit $result
fi

exit 0
