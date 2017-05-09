#lang racket

(require math/number-theory)

(define (nth-prime it n primes)
  (if (equal? n (length primes))
      (car primes)
      (if (prime? it)
          (nth-prime (+ it 2) n (cons it primes))
          (nth-prime (+ it 2) n primes))))

(nth-prime 3 10001 (list 2))