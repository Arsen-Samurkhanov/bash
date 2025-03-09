#! /bin/bash

FILE=/etc/hosts

if [ -r $FILE ]; then
    echo "$FILE is readable by $USER "
else 
    echo "$FILE is not readable by $USER "
fi    