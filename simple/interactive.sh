#! /bin/bash

echo -n "Hello $(basename $0) ! May I ask your Name? "
read
echo "Hello $REPLY"
exit 0