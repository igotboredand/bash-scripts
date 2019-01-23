#!/bin/bash

expected_sum="e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
calculated_sum=$(sha256sum sha256.ex|awk {'print $1'})

if [[ "$calculated_sum" = "$expected_sum" ]]
then
	echo "the expected sum and the caluclated sum match"
else
	echo "They do not match"
	return
fi