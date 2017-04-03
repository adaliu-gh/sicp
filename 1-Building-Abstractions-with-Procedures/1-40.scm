(define (cubic a b c)
  (lambda (x)
    (+ (expt x 3)
       (* a x x)
       (* b x)
       c)))

;;======================

(define (newtons-method f guess)
  (define (newton-transform f)
    (lambda (x) (- x (/ (f x)
                        ((deriv f) x)))))
  (fixed-point (newton-transform f) guess))

(define (fixed-point f guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) dx))
  (let ((next (f guess)))
    (if (close-enough? guess next)
        next
        (fixed-point f next))))

(define (deriv f)
  (lambda (x) (/ (- (f (+ x dx)) (f x)) dx)))

(define dx 0.00001)

