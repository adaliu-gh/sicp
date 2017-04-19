(define (install-sparse-poly-package)
  ;; internal procedures
  (define (make-term order coeff) (list order coeff))
  (define (order term) (car term))
  (define (coeff term) (cadr term))
  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
        term-list
        (let ((first (first-term term-list)))
          (cond
           ((> (order term) (order first))
            (cons term term-list))
           ((= (order term) (order first))
            (cons (make-term order (add (coeff term) (coeff first)))))
           (else (cons first (adjoin-term term (rest-terms term-list))))))))

  ;; interface
  (define (tag x) (attach-tag 'sparse-poly x))
  (put 'make-terms 'sparse-poly
       (lambda (x) (tag x)))
  (put 'order 'sparse-poly order)
  (put 'coeff 'sparse-poly coeff)
  (put 'adjoin-term 'sparse-poly
       (lambda (x y) (tag (adjoin-term x y)))))

(define (install-dense-poly-package)
  ;; internal procedures
  (define (adjoin-term order coeff term-list)
    (let ((len (length term-list)))
      (cond
       ((=zero? coeff) term-list)
       ((> order len) (error "xxx"))
       ((= order len) (cons coeff term-list))
       ((= order (- len 1)) (cons (add coeff (first-term term-list))
                                  (rest-terms term-list)))
       (else (cons (first-term term-list)
                   (adjoin-term order coeff (rest-terms term-list)))))))

  ;; interface procedures
  (define (tag x) (attach-tag 'dense-poly))
  (put 'make-terms 'dense-poly (lambda (x) (tag x)))
  (put 'adjoin-term 'dense-poly
       (lambda (x y) (tag (adjoin-term x y)))))

(define (install-poly-terms-package)
  ;; internal procedures
  (define (make-sparse-terms x)
    ((get 'make-terms 'sparse-poly) x))
  (define (make-dense-terms x)
    ((get 'make-term 'dense-poly) x))
  (define (adjoin-term x y)
    ((get 'adjoin-term (type-tag y)) x y))

  ;; interface
  (define (tag x) (attach-tag 'poly-terms))
  (put 'make-sparse-terms 'poly-terms
       (lambda (x) (tag (make-sparse-terms x))))
  (put 'make-dense-terms 'poly-terms
       (lambda (x) (tag (make-dense-terms x))))
  (put 'adjoin-term 'poly-terms
       (lambda (x y) (tag (adjoin-term x y)))))
