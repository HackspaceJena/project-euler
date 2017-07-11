#lang racket

(require math/number-theory)

(define (max-prime-factor x)
  (if (prime? x) x
      (for/or ((i (filter prime? (range 2 (sqrt x)))))
        (if (zero? (remainder x i)) (max-prime-factor (quotient x i)) #f))))

(max-prime-factor 600851475143)