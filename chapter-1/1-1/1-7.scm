;; Number -> Number
;; find the sqrt root of x
(define (sqrt-iter guess x)
  (define (good-enough? guess)
    (< (abs (- guess (improve guess))) 0.0001)) ;; improved good-enough?
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))
  (if (good-enough? guess)
      guess
      (sqrt-iter (improve guess) x)))

(define (sqrt x)
  (sqrt-iter 1 x))
