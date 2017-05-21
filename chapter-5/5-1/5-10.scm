(define (register-exp? exp) (tagged-list? exp 'register))
(define (register-exp-reg exp) (cadr exp))
