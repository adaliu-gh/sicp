(define (apply-generic op . args)

  (define (successive-raise.v1 a1 a2)
    (let ((proc (get 'raise (type-tag a1))))
      (if proc
          (let ((raised (raise a1)))
            (if (same-type? raised a2)
                (list raised a2)
                (successive-raise.v1 raised a2)))
          #false)))

  (define (successive-raise.v2 a b)
    (if (same-type? a b)
        (list a b)
        (let ((proc (get 'raise (type-tag a))))
          (if proc
              (successive-raise.v2 (raise a) b)
              #false))))

  (let ((types (map type-tag args)))
    (let ((proc (get op types)))
      (if proc
          (apply proc (map contents args))
          (if (= 2 (length args))
              (let ((a1 (car args))
                    (a2 (cadr args)))
                (let ((a1->a2 (successive-raise.v1 a1 a2))
                      (a2->a1 (successive-raise.v1 a2 a1)))
                  (cond
                   (a1->a2
                    (apply apply-generic (cons op a1->a2)))
                   (a2->a1
                    (apply apply-generic (cons op (reverse a2->a1))))
                   (else (error "xxx")))))
              (error "xxx"))))))

(define (same-type? a b)
  (eq? (type-tag a) (type-tag b)))
