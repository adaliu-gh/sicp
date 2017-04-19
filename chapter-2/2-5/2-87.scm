(define (install-polynomial-package)
  ...
  (define (=zero? p)
    (define (all-coeff-zero? coeffs)
      (cond
       ((null? coeffs) #true)
       ((=zero? (car coeffs))
        (all-coeff-zero? (cdr coeffs)))
       (else #false)))
    (let ((all-coeffs (map coeff (term-list p))))
      (all-coeff-zero? all-coeffs)))

  ;; interface
  (put '=zero? 'polynomial =zero?))
