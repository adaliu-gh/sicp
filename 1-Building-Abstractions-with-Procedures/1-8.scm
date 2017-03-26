;; Number -> Number
;; find the cube root of number x
(define (cube-root x)

  (define (cube-root/iter guess)
    (if (good-enough? guess)
        guess
        (cube-root/iter (improve guess))))

  (define (good-enough? guess)
    (< (abs (- guess (improve guess))) 0.0001))

  (define (improve guess)
    (/ (+ (* 2 guess)
          (/ x (expt guess 2)))
       3))

  (cube-root/iter 1.0))

