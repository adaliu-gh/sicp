(define (install-complex-package)
  ...
  (put 'project 'complex
       (lambda (x) (make-real (real-part x)))))

(define (install-real-package)
  ...
  (put 'project 'real
       (lambda (x) (make-integer (round x)))))

(define (install-rational-package)
  ...
  (put 'project 'rational
       (lambda (x) (quotient (numer x) (denom x)))))


(define (project x)
  (apply-generic 'project x))


(define (drop x)
  (let ((proc (get 'project (type-tag x))))
    (if proc
        (let ((projected (project x)))
          (if (equ? x (raise projected))
              (drop (project x))
              x))
        x)))
