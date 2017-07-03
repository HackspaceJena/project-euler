#!/bin/bash

declare -i sum=0

for i in {1..999}; do
    { 
        echo $i | grep -E "*[05]$" || factor $i | grep -P "\d+:(\s\d)*(\s[35])(\s\d*)*$"; 
    } > /dev/null && sum=$(( $sum + $i ))
done

echo "$sum"
