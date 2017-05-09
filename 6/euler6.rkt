#lang racket

(- (* (apply + (range 1 101)) (apply + (range 1 101)))
   (foldl + 0 (map (λ (x) (* x x)) (range 1 101))))