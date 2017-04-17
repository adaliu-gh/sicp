(define (apply-generic op . args)

  (define (coerceion-all args type-list)
    (cond
     ((null? args) '())
     (else (let ((type (car type-list))
                 (arg (car args))
                 (arg->type (get-coercion (type-tag arg) type)))
             (cond
              ((eq? type (type-tag arg))
               (cons arg (coerceion-all (cdr args) (cdr type-list))))
              (arg->type
               (cons (arg->type arg)
                     (coerceion-all (cdr args) (cdr type-list))))
              (else
               (error "could not coerce the args" (list args type-list))))))))

  (define (recur type-lists)
    (if (null? type-lists)
        (error "no method for the types" (list op args))
        (let ((proc (get op (car type-lists))))
          (if proc
              (apply proc (coerceion-all args (car type-lists)))
              (recur (cdr type-lists))))))

  (let ((type-list (permutation (map type-tag args))))
    (recur type-list)))

(define (permutation list)
  (define (iter results count)
    (if (= count 0)
        results
        (iter
         (fold (lambda (x y)
                 (append x y)) '()
                 (map (lambda (y) (map (lambda (x) (cons x y)) list)) results) )
         (- count 1))))
  (iter (map (lambda (x) '()) list) (length list)))

(define (fold op initial list)
  (if (null? list)
      initial
      (fold op (op (car list) initial) (cdr list))))

;; e.x.
;; (scale-complex 'scheme-number 'complex 'rational)

;; (put 'scale-complex '(scheme-number complex complex)
     ;; (lambda (x y z) ...))
