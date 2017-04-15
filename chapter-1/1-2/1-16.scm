;; Number -> Number
;; calculate the expt of a number b

(define (fast-expt b n)
  (define (fast-expt-iter a b n)
    (cond
     [(= 0 n) a]
     [(even? n) (fast-expt-iter a (* b b) (/ n 2))]
     [else (fast-expt-iter (* a b) b (- n 1))]))
  (fast-expt-iter 1 b n))
