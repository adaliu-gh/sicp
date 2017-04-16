;; Version - 1
;; Generic-number -> Boolean
(define (=zero? data)
  (cond
   ((number? data) (= data 0))
   ((eq? 'rational (type-tag data))
    (=zero? (contents data)))
   ((eq? 'complex (type-tag data))
    (and (=zero? (real-part data))
         (=zero? (imag-part data))))
   (else (error "xxx"))))

;; Version -2

(define (=zero? data)
  (apply-generic '=zero? data))

(define (install-scheme-number-package)
  ...
  (put '=zero? '(scheme-number)
       (lambda (x) (= x 0)))) ; scheme-number is the "base-type"

(define (install-rational-number-package)
  ...
  (put '=zero? '(rational)
       (lambda (x) (=zero? (numer x) 0)))) ;the numer part might be another type of number, for example a rational number

(define (install-complex-number-package)
  ...
  (put '=zero? '(complex)
       (lambda (x)
         (and (=zero? (real-part x))  ; ibid
              (=zero? (imag-part x)))))) ;ibid
