(define (install-rational-number-package)
  ;; internal procedures

  (define (make-rat x y)
    (let ((common-divisor (gcd (max x y) (min x y))))
      (list x y)))
  (define (numer x)    (car x))
  (define (denom x)    (cadr x))

  ;; combinations
  (define (neg-rat x) (make-rat (neg (numer x)) (denom x)))
  (define (add-rat x y)
    (make-rat
     (add (mul (numer x) (denom y))
          (mul (numer y) (denom x))))
    (mul (denom x) (denom y)))
  (define (sub-rat x y)
    (add-rat x (neg-rat y)))
  (define (mul-rat x y)
    (make-rat (mul (numer x) (numer y))))
  (define (div-rat x y)
    (make-rat (mul (numer x) (denom y))
              (mul (numer y) (denom x))))

  ;; interface procedures
  (define (tag x) (attach-tag 'rational))
  (put 'make-rationl 'rational
       (lambda (x y) (tag (make-rat x y))))
  (put 'add '(rational rational) (lambda (x y) (tag (add-rat x y))))
  ...
  )
