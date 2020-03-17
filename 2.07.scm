#lang scheme

; Программа Лизы неполна, поскольку она не определила, как реализуется абстракция интервала.
; Вот определение конструктора интервала:
; (define (make-interval a b) (cons a b))
; Завершите реализацию, определив селекторы upper-bound и lower-bound.

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

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
;(print (add-interval R1 R2))