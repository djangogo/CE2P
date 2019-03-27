#!/usr/bin/env bash

# Delete all pyc python bytecode file
find -name "*.pyc" -not -path "./venv/*" -delete
# find . -name '*.pyc' -delete
# find . -name "*.pyc" -exec rm -f {} \;

# Delete all objs in libs folder
pushd libs
find . -name '*.o' -delete
popd
