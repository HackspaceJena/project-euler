#lang typed/racket

(foldl (λ ((x : Nonnegative-Integer)
           (y : Nonnegative-Integer))
         (if (or (zero? (remainder x 3))
                 (zero? (remainder x 5)))
             (+ x y) y)) 0 (range 1 1000))