#lang scheme

; Определите процедуру last-pair, которая возвращает список, содержащий только последний
; элемент данного (непустого) списка.
; (last-pair (list 23 72 149 34))
; (34)

(define (last-pair list) 
  (if (null? (cdr list)) 
      list 
      (last-pair (cdr list))))

;(last-pair (list 23 72 149 34))