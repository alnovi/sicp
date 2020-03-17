#lang scheme

; Измените свою процедуру reverse из упражнения 2.18 так, чтобы получилась процедура deep-
; reverse, которая принимает список в качестве аргумента и возвращает в качестве значения
; список, где порядок элементов обратный и подсписки также обращены. Например:
; (define x (list (list 1 2) (list 3 4)))
; x
; ((1 2) (3 4))
; (reverse x)
; ((3 4) (1 2))
; (deep-reverse x)
; ((4 3) (2 1))

(define (deep-reverse items)
  (define (reverse-item element) 
      (if (list? element) 
          (deep-reverse element) 
          element))
  
  (define (deep-reverse-iter source result)  
    (if (null? source) 
        result 
        (deep-reverse-iter (cdr source) (cons (reverse-item (car source)) result))))
  
  (deep-reverse-iter items (list)))


;(deep-reverse (list (list 1 2) (list 3 4)))