
(define tolerance 0.00001)

(define (fixed-point f first-guess)

  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display guess)
      (if (close-enough? guess next)
          next
          (try next))))

  (try first-guess))

(define (f)
  (fixed-point (lambda (x) (/ (log 1000)
                              (log x))) 2))


;; results: 34 steps of trying

(define (f-average-damping)
  (fixed-point (lambda (x)
                 (/ (+ (/ (log 1000) (log x)) x) 2)) 2))

;; results: 9 steps of trying


