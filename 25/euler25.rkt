#lang racket

(define (numdigits x)
  (string-length (number->string x)))

(define (fibs limit lst)
  (if (equal? (numdigits (car lst)) limit)
      (length lst)
      (fibs limit (cons (+ (car lst) (cadr lst)) lst))))

(fibs 1000 '(1 1))