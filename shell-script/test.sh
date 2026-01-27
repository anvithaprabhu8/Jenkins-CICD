#!/bin/bash
output=$(./app.sh)

if [[ "$output" == *"Hello"* ]]; then
   echo "Test has passed"
   exit 0
else
   echo "Test has failed"
   exit 1
fi
