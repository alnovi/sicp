#lang scheme

(define (f n)
  (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (if (< count 0)
    count
    (if (= count 0)
      c
      (f-iter (+ a b c) a b (- count 1)))))

; Test f(n)
(define (test n)
  (if (< n 3)
      n
      (+ (test (- n 1)) (test (- n 2)) (test (- n 3)))))


;(define n -10)
;(f n)
;(test n)