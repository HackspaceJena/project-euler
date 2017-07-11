#lang racket

(require math/number-theory)

(define (primefactors x)
  (if (prime? x)
      (list x)
      (for/or ((i (cons 2 (range 3 (+ 1 (ceiling (sqrt x))) 2)))
               #:when (prime? i)
               #:when (zero? (remainder x i)))
        (cons i (primefactors (quotient x i))))))

(define (recur x)
  (if (and
       (equal? (length (remove-duplicates (primefactors x))) 4)
       (equal? (length (remove-duplicates (primefactors (+ x 1)))) 4)
       (equal? (length (remove-duplicates (primefactors (+ x 2)))) 4)
       (equal? (length (remove-duplicates (primefactors (+ x 3)))) 4))
      x
      (recur (+ x 1))))

(recur 2)