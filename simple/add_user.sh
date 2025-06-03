#! /bin/bash

#sudo -i
for u in bob joe; do
useradd $u
echo "$u:Password1" | chpasswd
passwd -e $u # prompt user to change password after 1st login
done