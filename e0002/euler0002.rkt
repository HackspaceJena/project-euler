#lang racket

(define (fib i)
  (cond [(equal? 0 i) 1]
        [(equal? 1 i) 2]
        (else (+ (fib (- i 1))(fib (- i 2))))))

(define (fiblist it limit lst)
  (cond [(equal? limit it) lst]
        (else (fiblist (+ it 1) limit
                       (cons (fib it) lst)))))

(foldl + 0 (filter even? (fiblist 0 4000000 '())))