#! /bin/bash

read -p "Enter a username: "
if (grep "$REPLY" /etc/passwd > /dev/null) ; then
    echo "The user $REPLY exists"
    exit 1
fi  


