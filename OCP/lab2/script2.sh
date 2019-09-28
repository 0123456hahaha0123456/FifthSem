#!/bin/bash

solve(){
        #if [[ $1 = +([0-9]) ]]; then
        if (( $1 >=0 )); then
            echo "Inputed count of processes: $1 - equal or greater processes started by users:"
            users=`ps -Ao user | sed 1d | sort | uniq -c`
            echo "$users" | nawk -v count=$1 '{ if ($1 >= count) print $2}'
        else
            echo "Wrong argument  №$count = $1: Script aimed to work with positive numbers."
        fi
}

count=1
if [ -n "$1" ]; then
    while [ -n "$1" ] 
    do
        echo "$1" | ggrep -Eq '^[+-]?[0-9]+$' && solve $1 || echo "Please try again with argument numbers of processes"
        ((count=count+1))
        shift
    done
else
    echo "Please try again with argument number of processes"
fi






