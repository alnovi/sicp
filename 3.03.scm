#lang scheme

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Недостаточно денег на счете"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (dispatch m pass)
    (if (= pass password)
        (cond ((eq? m `withdraw) withdraw)
          ((eq? m `deposit) deposit)
          (else (error "Неизвестный вызов -- MAKE-ACCOUNT" m)))
        (error "Неверный пароль" pass)))
  dispatch)


;(define pass 123)
;(define acc (make-account 100 pass))

;((acc `withdraw pass) 50)
;((acc `withdraw pass) 60)
;((acc `deposit pass) 40)
;((acc `withdraw pass) 60)