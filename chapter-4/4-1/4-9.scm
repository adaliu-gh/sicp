;; do .. until ...
(define (do-until-package-install)
  (define (do-body exp)
    (car exp))
  (define (until-cond exp)
    (caddr exp))
  (define (do->combination exp)
    (let ((name (get-a-variable))))
    (make-begin
     (make-definition
      name
      (make-lambda '()
                   (make-begin (do-body exp)
                               (make-if (until-cond exp)
                                        'done
                                        (make-call name '())))))
     (make-call name '())))
  (define (eval-self exp env)
    (eval (do->combination exp) env))

  (define (tag x) (attach-tag 'do x))
  (put 'do 'eval eval-self))
