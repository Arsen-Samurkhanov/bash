#! /bin/bash

who | grep $USER > /dev/null 2>&1 && write $USER < message.txt