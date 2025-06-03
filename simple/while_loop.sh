#! /bin/bash

COUNT=10

while (($COUNT>=0))
do
    echo -e "$COUNT \c"   # \c allows to print output in one line
    ((COUNT-- ))
done
#echo