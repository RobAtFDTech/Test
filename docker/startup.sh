#!/bin/sh

input=$1
app=test

# Run the application
cd /testFolder
./$app $input
if [ $? -ne 0 ]
then
	echo "Test application FAIL - exiting"
	exit 1
fi

# Compare the actual results to the expected results
diff=$(diff -y -W 72 test.log expected.log)
if [ $? -eq 0 ]
then
        echo "Compare for $app::$input is OK"
else
	echo "Compare for $app::$input NOT OK"
        echo "$diff"
	exit 1
fi

exit 0
