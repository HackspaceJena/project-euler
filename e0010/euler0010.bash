#!/usr/bin/bash

# I have yet to see this script coming to an end...

declare -i primeSum=0

for num in {2..2000000}; do 
    [[ "$(factor $num | cut -d " " -f2)" != $num ]] || primeSum=$(( $primeSum + $num ))
done
echo "$primeSum"
