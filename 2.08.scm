#lang scheme

; Рассуждая в духе Лизы, опишите, как можно вычислить разность двух интервалов. Напишите
; соответствующую процедуру вычитания, называемую sub-interval.

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y) 
  (make-interval (- (lower-bound x) (upper-bound y)) 
                 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))


;(define R1 (make-interval 8 12))
;(define R2 (make-interval 22 28))
;(define R1-2 (add-interval R1 R2))
;(print (sub-interval R1-2 R1))