#lang racket


(define squarenums (map (λ (x) (* x x)) (range 1 500)))

(define squaresums
  (for/list ((i squarenums))
    (for/list ((j (cdr squarenums)))
      (list (+ i j) i j))))

(apply * (map sqrt
              (first (filter
                      (λ (x) (equal? 1000 (+ (sqrt (first x)) (sqrt (second x)) (sqrt (third x)))))
                      (filter (λ (x) (member (first x) squarenums)) (apply append squaresums))))))