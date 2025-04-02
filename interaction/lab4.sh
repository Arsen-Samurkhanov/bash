#! /bin/bash 

FILE="$(systemctl status docker | grep running)"
  
if [[ $FILE = *"active"* ]]; then
   echo "matches"
   exit 0
fi

echo "after code"