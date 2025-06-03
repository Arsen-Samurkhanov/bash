#! /bin/bash

read -p "Enter firts string: " str1
read -p "Enter second string " str2


if [[ $str1 = $str2 ]]; then
    echo "Strings are identical "
else
    echo "Strings are not identical "   
fi     