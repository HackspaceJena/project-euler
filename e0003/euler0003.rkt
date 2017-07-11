#lang typed/racket

(require math/number-theory)

(: max-prime-factor (-> Integer (U False Integer)))
(define (max-prime-factor x)
  (if (prime? x) x
      (for/or ((i (filter prime? (range 2 (ceiling (assert (sqrt x) real?)))))
        #:when (zero? (remainder x i)))
        (max-prime-factor (quotient x i)))))

(max-prime-factor 600851475143)