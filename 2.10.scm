#lang scheme

; Бен Битобор, системный программист-эксперт, смотрит через плечо Лизы и замечает: неясно, что
; должно означать деление на интервал, пересекающий ноль. Модифицируйте код Лизы так, чтобы
; программа проверяла это условие и сообщала об ошибке, если оно возникает.

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
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (error "Деление на интервал в котором присутсвует ноль" y)
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))


;(define R1 (make-interval 30 40))
;(define R2 (make-interval 10 20))
;(define R3 (make-interval 0 10))

;(print (div-interval R1 R2))
;(print (div-interval R1 R3))