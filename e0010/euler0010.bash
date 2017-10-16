#!/bin/bash

# I have yet to see this script coming to an end...

declare -i primeSum=2
sequence=$(seq 3 2 2000000)

for num in $sequence; do
    echo $num   
    [[ "$(factor $num | cut -d " " -f2)" != $num ]] || primeSum=$(( $primeSum + $num ))
done
echo "$primeSum"
