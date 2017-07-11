#!/usr/bin/node

console.log(
    [...Array(999).keys()]
        .filter( x => (x+1) % 3 == 0 || (x+1) % 5 == 0)
        .reduce( (sum, x) => sum + x + 1)
    + 1
);
