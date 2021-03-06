(define (let*-package-install)
  (define (let*-body let*)
    (cdr let*))
  (define (let*-parameters let*)
    (car let*))
  (define (let*->nested-lets paras body)
    (if (null? (cdr paras))
        (make-let paras body)
        (make-let (list (car paras))
                  (let*->nested-lets (cdr paras) body))))
  (define (eval-self let* env)
    (eval (let*->nested-lets
           (let*-parameters let*)
           (let*-body let*)) env))
  (define (tag x) (attach-tag 'let* x))
  (put 'let* 'eval eval-self))
