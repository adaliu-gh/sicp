;; a
;; (define x 3) will be seen as an application

;; b
(define (application? exp) (tagged-list? exp 'call))
(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))
