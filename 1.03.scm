#lang scheme

(define (square x) (* x x))

(define (sum-squares a b) (+ (square a) (square b)))

(define (calculate a b c)
  (cond ((and (>= a c) (>= b c)) (sum-squares a b))
        ((and (>= a b) (>= c b)) (sum-squares a c))
        (else (sum-squares b c))))



;(calculate 1 3 3)
;(calculate 3 1 3)
;(calculate 3 3 1)