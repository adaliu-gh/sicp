(load "2-12.scm")

(define (percent-of-mul a b)
  (let ((a-percent (percent a))
        (b-percent (percent b)))
    (/ (+ b-percent a-percent)
       (+ 1 (* a-percent b-percent)))))


(define p1 (make-center-percent 1 0.1))
(define p2 (make-center-percent 2 0.2))
(equal? (percent-of-mul p1 p2) (percent (mul-interval p1 p2)))
;; => #t

