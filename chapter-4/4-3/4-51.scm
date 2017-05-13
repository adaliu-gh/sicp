(define (analyze-permanent-set exp)
  (let ((var (assignment-variable exp))
        (vproc (assignment-value exp)))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2)
               (set-variable-value! var val env)
               (succeed 'ok fail2))
             fail))))

;; if set! is used here;
;; then count is forever 1, if try-again doesn't fail
