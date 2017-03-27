;; Number Number -> Number
;; calculate the product of two numbers
(define (mul a b)
  (define (halve x) (/ x 2))
  (define (double x) (+ x x))
  (cond
   [(= b 0) 0]
   [(even? b) (mul (double a) (halve b))]
   [else (+ a (mul a (sub1 b)))]))
