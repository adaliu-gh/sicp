;; Number Number -> Number
;; calculate the product of two numbers
(define (* a b)

  (define (halve x) (/ x 2))
  (define (double x) (+ x x))
  (define (*-iter a b)
    (cond
     [(= a 1) b]
     [(= a 0) 0]
     [else (*-iter (halve a) (double b))]))

  (if (even? a)
      (*-iter a b)
      (- (*-iter (add1 a) b) b)))
