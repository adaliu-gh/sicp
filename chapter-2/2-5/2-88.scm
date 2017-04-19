(define (install-polynomial-package)
  ...
  (define (neg-poly p)
    (make-poly (variable p)
               (map (lambda (x)
                      (make-term (order x)
                                 (neg (coeff x))))
                    (term-list p))))

  (define (sub-poly p1 p2)
    (add-poly p1 (neg-poly p2)))

  ;; interface
  (put 'sub '(polynomial polynomial)
       (lambda (x y) (tag (sub-poly x y))))
  (put 'neg 'polynomial
       (lambda (x) (tag (neg-poly x)))))
