#include <cmath>
#include <vector>
#include <algorithm>
#include <iostream>

void sieve(std::vector<int>& primes, int const limit) {
    if (limit < 2) {
        return;
    } else if (limit < 3) {
        primes.push_back(2);
        return;
    }
    primes.push_back(2);
    primes.push_back(3);

    for (int num = 5; num <= limit; num += 2) {
        int sqrtnum = (int) std::sqrt(num);
        bool isPrime = true;
        for (auto primeIt = ++primes.begin(); primeIt != primes.end() && *primeIt <= sqrtnum; ++primeIt) {
            if (num % *primeIt == 0) {
                isPrime = false;
                break;
            }
        }
        if (isPrime) {
            primes.push_back(num);
        }
    }
}

int main(void) {
    constexpr int limit = 1000000;
    constexpr int PRIMELIMIT = limit - 1;
    std::vector<int> primes;
    sieve(primes, PRIMELIMIT);

    std::vector<int> circular;
    auto primeIt = primes.begin();
    while (*primeIt < 10) {
        circular.push_back(*primeIt);
        ++primeIt;
    }
    int tens = 10;
    int nextTens = 100;
    int rotations = 2;

    while (primeIt != primes.end()) {
        if (*primeIt >= nextTens) {
            tens *= 10;
            nextTens *= 10;
            ++rotations;
        }

        bool isCircular = true;
        int prime = *primeIt;
        for (int i = 1; i < rotations; ++i) {
            prime = prime / 10 + (prime % 10) * tens;
            isCircular = std::binary_search(primes.begin(), primes.end(), prime)? true: false;
            if (!isCircular) {
                break;
            }
        }
        if (isCircular) {
            circular.push_back(*primeIt);
        }
        ++primeIt;
    }

    std::cout << circular.size() << std::endl;
}
