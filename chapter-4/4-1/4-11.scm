(define (environment-install)
    ;; environment
    (define (first-frame env) (car env))
    (define (enclosing-environment env) (cdr env))
    (define the-empty-environment '())

    ;; frame
    (define (frame-variables frame)
      (if (null? frame)
          '()
          (cons (caar frame)
                (frame-variables (cdr frame)))))
    (define (frame-values frame)
      (if (null? frame)
          '()
          (cons (cdar frame)
                (frame-values (cdr frame)))))
    (define (make-frame variables values)
      (define (recur vars vals)
        (cond
         ((and (null? vars) (null? vals))  'done)
         (else (cons (cons (car vars) (car vals))
                     (recur (cdr vars) (cdr vals)))))))
    (define (add-binding-to-frame! var val frame)
      (set-cdr! frame (cons (list var val) (cdr frame))))

    ...

    (define (dispatch arg)
      ...)
    )

