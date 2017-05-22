// This solution needs the GNU MP Bignum library
// g++ euler10.cpp -o euler10 -lgmpxx -lgmp

#include <gmpxx.h>
#include <cmath>
#include <vector>
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
    constexpr int limit = 2000000;
    constexpr int PRIMELIMIT = limit - 1;
    std::vector<int> primes;
    sieve(primes, PRIMELIMIT);

    mpz_class sum = 0;

    for (auto primeIt = primes.begin(); primeIt != primes.end(); ++primeIt) {
        sum += *primeIt;
    }

    std::cout << sum << std::endl;
    return EXIT_SUCCESS;
}
