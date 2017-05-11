;; my syntax :
;; (define (f a b c (lazy c) (lazy-memo d) . e))

;; the eval function is the same as in the text
;; apply and force should be changed
(define (apply procedure arguments env)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure
          procedure
          (list-of-arg-values arguments env)))
        ((compound-procedure? procedure)
         (eval-sequence
          (procedure-body procedure)
          (extend-environment
           (parameter-names (procedure-parameters procedure)) ;; changed
           (maybe-delayed-args (procedure-parameters procedure) arguments env) ;; changed
           (procedure-environment procedure))))
        (else (error "Unknown procedure type: APPLY"
                     procedure))))

(define (maybe-delayed-args parameters arguments env)
  (define (get-real-arg para arg)
    (cond ((lazy-para? para) ;; core
           (delay arg env))
          ((memo-para? para) ;; core
           (delay-memo arg env))
          (else arg)))
  (map get-real-arg parameters arguments))

(define (parameter-names parameters)
  (map (lambda (x) (if (pair? x) (cadr x) x)) parameters))

(define (lazy-para? para)
  (and (pair? para)
       (tagged-list? para 'lazy)))
(define (memo-para? para)
  (and (pair? para)
       (tagged-list? para 'lazy-memo)))

(define (delay exp env)
  (cons 'thunk exp env))
(define (delay-memo exp env)
  (cons 'thunk-memo exp env))

(define (force obj)
  (cond ((thunk? obj)
         (actual-value (thunk-value obj) (thunk-environment obj)))
        ((thunk-memo? obj)
         (let ((result (actual-value (thunk-value obj) (thunk-environment obj))))
           (set-car! obj 'evaluated-thunk)
           (set-car! (cdr obj) result)
           (set-cdr! (cdr obj) '())
           result))
        ((evaluated-thunk? obj) (thunk-value obj))
        (else obj)))
