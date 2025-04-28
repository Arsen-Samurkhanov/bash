#! /bin/bash
for f in *
do
    if [ -d "$f" ]
    then 
        echo "we found directory $f "
        break
    fi
done
