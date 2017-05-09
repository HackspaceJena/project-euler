#lang racket

(require math/number-theory)

(define (primes x) (filter prime? (range 2 (sqrt x))))

(define (primefactors x primes)
  (if (prime? x)
      (list x)
      (if (zero? (remainder x (car primes)))
          (cons (car primes) (primefactors (quotient x (car primes)) primes))
          (primefactors x (cdr primes)))))

(apply max (primefactors 600851475143 (primes 600851475143)))