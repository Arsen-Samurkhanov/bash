#! /bin/bash 

USER="smith"
WHOAMI=$(whoami)


until [[ $WHOAMI = $USER ]]
do
   su - smith
   echo "not smith yes"
   sleep 60
done   
