#lang racket

(define (longest-collatz n)
  (let
      ((pivot (list 0 0)))
    (define (collatz lst)
      (if (equal? (car lst) 1)
      lst
      (if (even? (car lst))
          (collatz (cons (quotient (car lst) 2) lst))
          (collatz (cons (+ 1 (* 3 (car lst))) lst)))))
    (for ((i (range 1 n)))
      (if (>= (length (collatz (list i))) (second pivot))
          (set! pivot (list i (length (collatz (list i)))))
          0))
    pivot))

(display (first (longest-collatz 1000000)))