#! /bin/bash

to_lower(){
    input=$1
    output=$( echo $input | tr [A-Z] [a-z])
    return $output
}

to_lower