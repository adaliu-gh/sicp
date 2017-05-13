(define (analyze-if-fail exp)
  (let ((sproc (analyze (if-succeed exp)))
        (fproc (analyze (if-failure exp))))
    (lambda (env succeed fail)
      (sproc env
             (lambda (val fail2)
               (succeed val fail))
             (lambda () (fproc env succeed fail))))))

(define (if-succeed exp) (cadr exp))
(define (if-failure exp) (caddr exp))
