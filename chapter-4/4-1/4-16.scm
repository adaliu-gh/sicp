(load "meta-evaluator.scm")
;; a
(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars) (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             (if (eq? (car vals) '*unassigned*)
                 (error "Unassigned variable -- LOOKUP" var)
                 (car vals)))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable -- LOOKUP" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame) (frame-values frame)))))
  (env-loop env))

;; b
(define (scan-out-defines body)
    (let ((vars '())
          (vals '())
          (exps '()))
      (define (scan seq)
        (cond ((null? seq) 'done)
              ((definition? (car seq))
               (set! vars (cons (definition-variable (car seq)) vars))
               (set! vals (cons (definition-value (car seq)) vals))
               (scan (cdr seq)))
              (else
               (set! exps (cons (car seq) exps))
               (scan (cdr seq)))))
      (scan body)
      (if (null? vars)
          body
          (make-let
           (map (lambda (x) (list x '*unassigned*)) vars)
           (append (map (lambda (x y) (make-set! x y)) vars vals) exps)))))

(define (make-set! x y)
  (list 'set! x y))
(define (make-let vars exps)
  (cons 'let (cons vars exps)))

;; c
(define (procedure-body p) (scan-out-defines (list-ref p 2) ))
