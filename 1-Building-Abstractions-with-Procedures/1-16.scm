;; Number -> Number
;; calculate the expt of a number b
  (define (expt-iter b n)
    (cond [(= n 0) 1]
          [(even? n)
           (expt-iter (expt b 2) (/ n 2))]
          [else (* b (expt-iter b (- n 1)))]))

(define (expt-iter.v2 b n)
  (define (expt-iter/a a counter)
    (if (= counter n)
        a
        (expt-iter/a (* a b) (add1 counter))))
  (cond
   [(even? n) (expt-iter/a 1 0)]
   [else (expt-iter/a b 1)]))

