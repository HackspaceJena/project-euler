#lang racket

(require math/number-theory)

(define (primes it limit prim)
  (if (equal? it limit)
      prim
      (if (prime? it)
          (primes (+ it 1) limit (cons it prim))
          (primes (+ it 1) limit prim))))

(apply + (primes 1 2000000 (list)))