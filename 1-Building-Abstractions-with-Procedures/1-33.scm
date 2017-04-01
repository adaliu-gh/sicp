(load "1-23.scm")

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (cond
     [(> a b) result]
     [(filter a) (iter (next a) (combiner result (term a)) )]
     [else (iter (next a) result)]))
  (iter a null-value))

(define (sum-square-prime a b)
  (define square (lambda (x) (* x x)))
  (filtered-accumulate + 0 square a add1 b prime?))

(sum-square-prime 1 6)
;; => 39
