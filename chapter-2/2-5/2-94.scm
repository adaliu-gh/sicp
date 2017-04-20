;; polynomial polynomial -> polynomial
(define (remainder-terms a b)
  (cadr (div-terms a b)))

;; polynomial polynomial -> polynomial
(define (gcd-poly a b)
  (if (empty-termlist? b)
      a
      (gcd-poly b (remainder-terms a b))))

;; any any -> any
(define (greatest-common-divisor a b)
  (cond
   ((and (number? a) (number? b))
    (gcd a b))
   ((and (eq? 'polynomial (type-tag a))
         (eq? 'polynomial (type-tag b))
         (eq? (variable a) (variable b)))
    (gcd-poly a b))
   (else (error "xxx"))))
