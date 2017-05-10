(load "4-16.scm")
(define (letrec->let exp)
  (define paras (cadr exp))
  (define vars (map car paras))
  (define exps (map cadr paras))
  (define body (cddr exp))
  (define let-bindings (map (lambda (x) (list x '*unassigned*)) vars))
  (define let-settings (map (lambda (x y) (make-set! x y)) vars exps))
  (make-let let-bindings (append let-settings body)))

;; b
;; but if dynamic is the implementation, then inner definitions and let bindings both work
;; because Scheme implements lexical bindings, the undefined symbol in the lambda argument will elicit an error
