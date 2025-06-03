#! /bin/bash

mydir=/home/mydir
name="arsen"

if [ -d $mydir ] || [ -n $name ]; then
    echo "One of tests or both successes"
else 
    echo "Both failed"
fi