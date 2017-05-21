;; a
;; (assign n (reg val))
;; (restore val)
;; =>
;; (restore n)

;; b
(define (make-save inst machine stack pc)
  (let ((reg-name (stack-inst-reg-name inst))
        (reg (get-register machine
                           (stack-inst-reg-name inst))))
    (lambda ()
      (push stack (cons reg-name (get-contents reg)))
      (advance-pc pc))))

(define (make-restore inst machine stack pc)
  (let ((reg-name (stack-inst-reg-name inst))
        (reg (get-register machine (stack-inst-reg-name inst))))
    (lambda ()
      (let ((last-value (pop stack)))
        (if (eq? reg-name (car last-value))
            (set-contents! reg (cdr last-value))
            (else "error"))
        (advance-pc)))))

;; c

(define (make-stacks)
  (let ((stacks '()))
    (define (add-stack name)
      (set! stacks (cons (cons name (make-stack)) stacks)))
    (define (push name value)
      (let ((stack (assoc stacks name)))
        (if stack
            (push (cdr stack) value)
            (error "xxx"))))
    (define (pop name)
      (let ((stack (assoc stacks name)))
        (if stack
            (pop (cdr stack))
            (error "xxx"))))
    (define (initialize)
      (for-each (lambda (stack) ((cdr stack) 'initialize)) stacks))
    (define (dispatch message)
      (cond ((eq? message 'push) push)
            ((eq? message 'pop) pop)
            ((eq? message 'initialize) (initialize))
            ((eq? message 'add-stack) add-stack)
            (else (error "xxx"))))
    dispatch))
(define (push-stack stacks name value)
  ((stacks 'push) name value))
(define (pop-stack stacks name)
  ((stacks 'push) name))
(define (add-stack stacks name)
  ((stacks 'add-stack) name))


(define (make-new-machine)
  (let ((pc (make-register 'pc))
        (flag (make-register 'flag))
        (stacks (make-stacks))      ;; changed
        (the-instruction-sequence '()))
    ...
    (define (add-reg-stack name)
      (add-stack stacks name))
    ))

(define (make-machine register-names ops controller-text)
  (let ((machine (make-new-machine)))
    (for-each (lambda (register-name)
                ((machine 'allocate-register) register-name))
              register-names)
    (for-each (lambda (register-name)       ;; added
                ((machine 'add-reg-stack) register-name))
              register-names)
    ((machine 'install-operations) ops)
    ((machine 'install-instruction-sequence)
     (assemble controller-text machine))
    machine
    ))

(define (make-save inst machine stack pc)
  (let ((reg (get-register machine
                           (stack-inst-reg-name inst))))
    (lambda ()
      (push-stack stack (stack-inst-reg-name inst) (get-contents reg)) ;; changed
      (advance-pc pc))))

(define (make-restore inst machine stack pc)
  (let ((reg (get-register machine (stack-inst-reg-name inst))))
    (lambda ()
      (set-contents! reg (pop-stack stack (stack-inst-reg-name inst))) ;; changed
      (advance-pc pc))))
