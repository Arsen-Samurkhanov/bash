#! /bin/bash

mydir=/home/mydir
name="arsen"

if [ -d $mydir ] && [ -n $name ]; then
    echo "The name is not zero length and directory exists. "
else 
    echo "One of the tests failed. "
fi