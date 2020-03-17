#lang scheme

; Напишите процедуру fringe, которая берет в качестве аргумента дерево (представленное в ви-
; де списка) и возвращает список, элементы которого — все листья дерева, упорядоченные слева
; направо. Например,
; (define x (list (list 1 2) (list 3 4)))
; (fringe x)
; (1 2 3 4)
; (fringe (list x x))
; (1 2 3 4 1 2 3 4)

(define (fringe tree) 
  (cond ((null? tree) (list)) 
        ((pair? tree) (append (fringe (car tree)) 
                      (fringe (cdr tree)))) 
        (else (list tree))))


;(define x (list (list 1 2) (list 3 4)))
;(fringe (list))
;(fringe x)
;(fringe (list x x))