(define (smooth-1f f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

(define dx 0.000001)

((smooth-1f add1) 3)
;; => 4.0

;;=================

(define (smooth-nf proc n)
  ((repeated smooth-1f n) proc))

((smooth-nf add1 10) 3)
;; => 4.0
