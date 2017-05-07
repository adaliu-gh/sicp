;; a
;; (define x 3) will be seen as an application

;; left -> right
(define (list-of-values list env)
  (if (null? list)
      '()
      (let ((first (eval (car list) env)))
        (cons first (list-of-values (cdr list) env)))))

;; right -> left
(define (list-of-values list env)
  (if (null? list)
      '()
      (let ((rest (list-of-values (cdr list) env)))
        (cons (eval (car list) env) rest))))
