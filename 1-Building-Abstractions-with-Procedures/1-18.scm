;; Number Number -> Number
(define (mul-iter a b)

  (define (double x) (+ x x))
  (define (halve x) (/ x 2))
  (define (mul-iter x y n)
    (cond
     [(= n 0) x]
     [(even? n) (mul-iter x (double y) (halve n))]
     [else (mul-iter (+ x y) y (sub1 n))]))

  (mul-iter 0 a b))
