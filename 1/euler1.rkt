#lang racket

(define (multiples limit)
  (foldl + 0 (filter (lambda (x) (cond
                      [(= 0 (remainder x 3)) #t]
                      [(= 0 (remainder x 5)) #t]
                      (else #f)))
        (range limit))))

(multiples 1000)