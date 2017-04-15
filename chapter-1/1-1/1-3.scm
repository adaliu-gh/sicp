;; Number Number Number -> Number
;; return the sum of the squares of the two larger numbers
(define (sum-3-squares a b c)
  (define largest (max a b c))
  (define middle
    (cond
     [(= a largest) (max b c)]
     [(= b largest) (max a c)]
     [else (max a b)]))
  (+ (expt largest 2)
     (expt middle 2)))

