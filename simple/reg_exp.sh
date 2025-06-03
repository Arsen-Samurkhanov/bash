#! /bin/bash

shopt -s nocasematch #turn of case sensitivity 
read -p "Type color or mono for script output: "
if [[ $REPLY =~ colou?r ]]; then #this match both color and colour
    source ./color
fi
echo -e "${GREEN}This is $0 $RESET"
shopt -s nocasematch #reset case sensitivity
exit 0
