(load "1-37.scm")

(define (e-2 k)
  (define (d i)
    (cond
     [(= 2 (remainder i 3))
      (/ (add1 i) 1.5)]
     [else 1]))
  (cont-frac (lambda (i) 1.0)
             d
             k))

(e-2 1000)
;; => 0.7182818284590453

