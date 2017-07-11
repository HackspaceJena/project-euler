// C++-Lösung auf der Basis der C-Variante von Jörg Sommer
// Beinhaltet verbessertes Primzahlsieb

#include <cmath>
#include <cstdlib>
#include <vector>
#include <iostream>
#include <algorithm>

/** 
    prime: Vektor zum Speichern der Primzahlen
    limit: Obere Grenze des Bereichs in dem berechnet wird

    Implementiert eine optimierte Version des Sieb des Eratosthenes.
    Prüft nicht, ob die Grenze kleiner als 5 ist.
*/
static void sieve(std::vector<unsigned>& prime, unsigned const limit) {
    prime.push_back(2u);
    prime.push_back(3u);

    for (unsigned num = 5; num <= limit; num += 2) {
        unsigned sqrtnum = (unsigned) std::sqrt(num);
        bool isPrime = true;
        for (auto primeIt = ++prime.begin(); primeIt != prime.end() && *primeIt <= sqrtnum; ++primeIt) {
            if (num % *primeIt == 0) {
                isPrime = false;
                break;
            }
        }
        if (isPrime) {
            prime.push_back(num);
        }
    }

}

int main(void) {
    constexpr unsigned LIMIT = 50000000;
    constexpr unsigned PRIMELIMIT = (unsigned) std::sqrt(LIMIT);
    std::vector<unsigned> primes;
    primes.reserve(PRIMELIMIT / std::log(PRIMELIMIT)); // schätze Primzahldichte

    sieve(primes, PRIMELIMIT);
    std::cout << "Es wurden " << primes.size() << " Primzahlen gefunden" << std::endl;

    std::vector<unsigned> numbers;
    for (auto p4 = primes.begin(); p4 != primes.end(); ++p4) {
        unsigned pow4 = *p4 * *p4;
        pow4 *= pow4;
        if (pow4 >= LIMIT)
            break;

        for (auto p3 = primes.begin(); p3 != primes.end(); ++p3) {
            unsigned sum = pow4 + *p3 * *p3 * *p3;
            if (sum >= LIMIT)
                break;

            for (auto p2 = primes.begin(); p2 != primes.end(); ++p2) {
                unsigned pow2 = *p2 * *p2;

                unsigned sum2 = sum + pow2;
                if (sum2 >= LIMIT) {
                    break;
                }

                numbers.push_back(sum2);
            }
        }
    }

    //Zähle vorkommende Elemente
    unsigned count = 1;
    std::sort(numbers.begin(), numbers.end());
    for (auto n = ++numbers.begin(); n != numbers.end(); ++n) {
        if (*(n - 1) != *n) {
            ++count;
        }
    }

    std::cout << "Ergebnis: " << count << std::endl;

    return EXIT_SUCCESS;
}
