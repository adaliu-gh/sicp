(define (iterative-improve good-enough? improve)
  (define (iter x)
    (if (good-enough? x)
        x
        (iter (improve x))))
  iter)

;;======================

(define (sqrt x)
  (define tolerance 0.000001)
  (define (good-enough? y)
    (< (abs (- (* y y) x)) tolerance))
  (define (improve y)
    (/ (+ y (/ x y)) 2))

  ((iterative-improve good-enough? improve) 1))

;;==========================

(define (fixed-point f guess)
  (define tolerance 0.000001)
  (define (good-enough? x)
    (< (abs (- x (f x))) tolerance))

  ((iterative-improve good-enough? f) 1))

(fixed-point (lambda (x) (/ (+ x (/ 2.0 x)) 2)) 1)
;; => 1.4142135623746899
