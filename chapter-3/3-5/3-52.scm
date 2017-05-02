(load "stream.scm")
(define sum 0)
;; => 0
(define (accum x) (set! sum (+ x sum)) sum)
(define seq (stream-map accum (stream-enumerate-interval 1 20)))
sum
(define y (stream-filter even? seq))
;; => 210
(define z (stream-filter (lambda (x) (= (remainder x 5) 0)) seq))
(stream-ref y 7)
;; => 136
sum
