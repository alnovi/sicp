#lang scheme

; Определите процедуру reverse, которая принимает список как аргумент и возвращает список,
; состоящий из тех же элементов в обратном порядке:
; (reverse (list 1 4 9 16 25))
; (25 16 9 4 1)

(define (reverse items) 
  (define (reverse-iter source result) 
    (if (null? source) 
        result 
        (reverse-iter (cdr source) (cons (car source) result)))) 
  (reverse-iter items (list)))


;(reverse (list 1 4 9 16 25))