// This solution needs the GNU MP Bignum library
// g++ euler16.cpp -o euler16 -lgmpxx -lgmp

#include <gmpxx.h>
#include <cmath>
#include <vector>
#include <iostream>

int main(void) {
    mpz_class power = 1;
    mpz_class modulo = 0;
    mpz_class tens = 10;
    mpz_class digitsum = 0;

    for (int i = 1; i <= 1000; ++i) {
        power *= 2;
    }

    while (power != 0) {
        digitsum = digitsum + power % tens;
        power = power / 10;
    }

    std::cout << digitsum << std::endl;
    return EXIT_SUCCESS;
}
