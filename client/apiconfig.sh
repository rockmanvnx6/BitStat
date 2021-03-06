#!/bin/bash

# Script by Jia Jun Yong, 2019
#
# GOAL: To configure client side to work with API

echo "Please enter the link of your API in full:"

read apilink

replacestr="s@REPLACE@$apilink@g"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sed -i $replacestr src/components/ViewDetails.js
elif [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i -e $replacestr src/components/ViewDetails.js
    rm src/components/ViewDetails.js-e
fi

echo "Successfully configured API link to work with client side."
echo "If it's not configured correctly, please configure it at client/src/components/ViewDetails.js:187 and replace the API link."
