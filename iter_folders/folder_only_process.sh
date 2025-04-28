#! /bin/bash

for f in *
do
    if [ -d "$f" ] 
    then
        chmod 3777 "$f"
    else 
        continue   
    fi    
done