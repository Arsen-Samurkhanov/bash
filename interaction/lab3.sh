#! /bin/bash 


FILE=multi_line.sh1    
if [ -f  "/etc/ssh/ssh_config" ]; then
   echo "File $FILE exists."
   exit 0
fi

echo "after code"