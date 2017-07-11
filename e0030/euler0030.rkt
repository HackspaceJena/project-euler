#lang racket


(define (findlimit it)
  (if (> (expt 10 it) (* it (expt 9 5)))
      it
      (findlimit (+ it 1))))

(define (digits x)
  (map (λ (x) (- (char->integer x) 48))
   (string->list (number->string x))))

(apply +(filter (λ (x) (equal? x
                       (apply + (map (λ (x) (expt x 5)) (digits x)))))

          (range 2 (expt 10 (findlimit 1)))))
