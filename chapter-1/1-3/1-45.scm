(load "1-40.scm")
(load "1-43.scm")

(define (average-damp f)
  (lambda (x)
    (/ (+ x (f x)) 2)))

(define (fixed-point-of-transform f transform guess)
  (fixed-point (transform f) guess))

(fixed-point-of-transform (lambda (x) (/ 4.0 x)) average-damp 1)
;; => 2.000000000000002
(fixed-point-of-transform (lambda (x) (/ 8.0 (* x x))) average-damp 1)
;; => 1.9999981824788517
(fixed-point-of-transform (lambda (x) (/ 16.0 (* x x x))) (repeated average-damp 2) 1)
;; => 2.0000000000021965
(fixed-point-of-transform (lambda (x) (/ 32.0 (* x x x x))) (repeated average-damp 2) 1)
;; => 2.0000015129957607

(define (nth-power-root x n)
  (fixed-point-of-transform (lambda (y) (/ x (expt y (sub1 n))))
                            (repeated average-damp
                                      (quotient (+ n 2) 3)) 1))

(nth-power-root (expt 2.0 10) 10)
;; => 2.0000044972691784
(nth-power-root (expt 2.0 20) 20)
;; => 2.000052508408939
