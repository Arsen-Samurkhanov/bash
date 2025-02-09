#! /bin/bash

read -p "Which serever should be pinged " server_addr

ping -c3 $server_addr 2>1 > /dev/null || echo "Server Dead"
