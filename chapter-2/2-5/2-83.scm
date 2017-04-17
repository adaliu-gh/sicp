(define (install-integer-package)
  ...
  (put 'raise 'integer
       (lambda (x) (make-rational x 1))))

(define (install-rational-package)
  ...
  (put 'raise 'rational
       (lambda (x) (make-real (/ (numer x) (denom x))))))

(define (install-real-package)
  ...
  (put 'raise 'complex
       (lambda (x) (make-complex x 0))))

(define (raise x)
  (apply-generic 'raise x))
