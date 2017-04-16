;; Data Data -> Boolean
(define (equ? d1 d2)
  (and (eq? (type-tag d1) (type-tag d2))
       (equ? (contents d1) (contents d2))))

;; Version - 2

(define (equ? d1 d2)
  (apply-generic 'equ? d1 d2))

(define (install-scheme-number-package)
  ...
  (put 'equ? '(scheme-number scheme-number)
       (lambda (x y) (= x y))))

(define (install-rational-package)
  ...
  (put 'equ? '(rational rational)
       (lambda (x y) (= (* (numer x) (denom y))
                        (* (numer y) (denom x))))))

(define (install-complex-package)
  ...
  (put ('equ? '(complex complex))
       (lambda (x y)
         (or (and (= (real-part x) (real-part y))
                  (= (imag-part x) (imag-part y)))
             (and (= (mag-part x) (mag-part y))
                  (= (ang-part x) (ang-part y)))))))

;;=====================
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get 'op type-tags)))
      (if (null? proc)
          (error "xxx")
          (apply proc (map contents args))))))
