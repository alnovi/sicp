#lang scheme

(define (make-accumulator start)
  (lambda (amount)
    (begin (set! start (+ start amount)) start)))

;(define A (make-accumulator 5))
;(A 10)
;(A 10)
