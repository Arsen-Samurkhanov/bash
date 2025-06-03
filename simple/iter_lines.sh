#!/bin/bash
file="lines.txt"
IFS=$'\n' #Here we change the default IFS to be a new line
for var in $(cat $file)
do
echo " $var"
done
