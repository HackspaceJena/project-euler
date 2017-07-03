#!/usr/bin/node

function getPrimeList(max) {
    if (typeof max !== 'number' || max < 2) {
        return [];
    } else if (max===2) {
        return [2];
    }
    let primes = [2];

    for(i=3; i<=max; i++) {
        let isPrime = true;
        for(prime of primes) {
            if (i % prime === 0) {
                isPrime = false;
                break;
            }
        }

        if (isPrime) {
            primes.push(i);
        }
    }

    return primes;
}

console.time();
let primeList = getPrimeList(2000001);
console.timeEnd();
console.log("Found "+primeList.length+" prime numbers.");

console.time();
let primeSum = primeList.reduce( (sum, element) => sum + element);
console.timeEnd();
console.log(primeSum);
