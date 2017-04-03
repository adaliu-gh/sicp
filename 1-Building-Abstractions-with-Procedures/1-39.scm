(load "1-37.scm")

(define (tan-cf x k)
  (define square-x (- (expt x 2)))
  (cont-frac (lambda (i)
               (if (= i 1) x square-x))
             (lambda (i) (sub1 (* 2 i)))
             k))

(tan-cf 0 100)
;; => 0
(tan-cf (/ pi 2) 100)
;; => +inf.0
(tan-cf (/ pi 4) 10)
;; => 1.0
