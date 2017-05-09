#lang racket


(define (divisible-by? num lst)
  (andmap (λ (x) (zero? (remainder num x))) lst))

(define (find-divisible-num it lst)
  (if (divisible-by? it lst)
      it
      (find-divisible-num (+ 2 it) lst)))

(find-divisible-num 2 (range 1 21))