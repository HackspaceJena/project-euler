#lang racket

(foldl + 0 (map (λ (x) (- (char->integer x) 48))
            (string->list (number->string (expt 2 1000)))))