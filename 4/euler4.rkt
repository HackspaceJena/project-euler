#lang racket

(define (palindrome-number? n)
  (equal? (string->list (number->string n))
          (reverse (string->list (number->string n)))))

(apply max (filter palindrome-number?
        (flatten (for/list ((i (range 100 1000)))
                   (for/list ((j (range 100 1000))) (* i j))))))