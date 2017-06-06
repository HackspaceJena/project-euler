#lang typed/racket

(: collatz (-> Nonnegative-Integer (Listof Nonnegative-Integer)))
(define (collatz x)
    (cond
      ((equal? x 1) (list 1))
      ((even?  x)   (cons x (collatz (quotient x 2))))
      ((odd? x)     (cons x (collatz (+ 1 (* 3 x)))))
      (else (list))))

(argmax (λ ((x : Nonnegative-Integer)) (length (collatz x))) (range 1 1000000))
