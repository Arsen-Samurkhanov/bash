#! /bin/bash

myarr=(one two three four five)
echo ${myarr[1]}  #display second item
echo ${myarr[*]}  #display all items
unset myarr[1]    #remove second item
unset myarr       #remove all items
