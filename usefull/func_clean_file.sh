#!/bin/bash

function clean_file {
    sed -i.bak '/^\s*#/d;/^$/d' "$1"
}