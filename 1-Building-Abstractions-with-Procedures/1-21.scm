;; Number -> Number
;; find the smallest divisor

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond
   ((> (expt test-divisor 2) n) n)
   ((divides? test-divisor n) test-divisor)
   (else (find-divisor n (+ 1 test-divisor)))))

(define (divides? a b)
  (= (remainder b a ) 0))

(smallest-divisor 199) ; 199
(smallest-divisor 1999) ; 1999
(smallest-divisor 19999) ; 7
