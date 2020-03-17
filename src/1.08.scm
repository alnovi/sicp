#lang scheme

(define (square-nuton x)
  (define (square x) (* x x))
  (define (average x y) (/ (+ x y) 2))
  (define (improve y x) (average y (/ x y)))
  (define (check y x) (< (abs (- (square y) x)) 0.0000000001))
  (define (square-iter y x)
    (if (check y x)
      y
      (square-iter (improve y x) x)))
  (square-iter 1.0 x))

(define (qube-nuton x)
  (define (square x) (* x x))
  (define (qube x) (* x x x))
  (define (check y x) (< (abs (- (qube y) x)) 0.0000000001))
  (define (improve y x) (/ (+ (/ x (square y)) (* 2 y)) 3))
  (define (qube-iter y)
    (if (check y x)
        y
        (qube-iter (improve y x))))
  (qube-iter 1.0))


;(square-nuton 25)
;(qube-nuton 125)