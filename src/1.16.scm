#lang scheme

(define (fast-expt x n)
  (fast-expt-iter 1 x n))

(define (fast-expt-iter a b n)
  (define (square x) (* x x))
  (if (= n 0)
      a
      (if (even? n)
          (fast-expt-iter a (square b) (/ n 2))
          (fast-expt-iter (* a b) b (- n 1)))))


;(fast-expt 2 2)