#lang racket

(do ((n 20 (+ n 20)))
  ((andmap zero? (map ((curry remainder) n) (range 1 21))) n))