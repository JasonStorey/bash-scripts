#!/bin/bash -

# Simple examples and such

# Function that formats some strings and prints

function printFormatString() {
    local TEXT=$1
    local NUM=$2
    printf "usage: %s [ -a | -b ] %d\n" $TEXT $NUM
}
 
printFormatString 'Buddy' 100

