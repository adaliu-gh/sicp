
(define (pseudoremainder-terms p1 p2)
  (cadr (pseudo-div-terms p1 p2)))

(define (pseudo-div-terms p1 p2)
  (let ((highest-coeff (coeff (first-term (term-list p1))))
        (order-1 (order (first-term (term-list p1))))
        (order-2 (order (first-term (term-list p2)))))
    (div-terms (mul-terms p1
                          (list (make-term 0
                                           (expt highest-coeff (add 1 order-1 (neg order-2)))) ))
               p2)))

;; polynomial polynomial -> polynomial
(define (gcd-poly a b)
  (if (empty-termlist? b)
      a
      (gcd-poly b (pseudoremainder-terms a b))))
(define (gcd-terms a)
  (let ((terms (map coeff (term-list a))))
    (let ((divisor (fold-right (lambda (x y) (gcd x y)) terms)))
      (div-terms  a (list (make-terms 0 divisor))))))
