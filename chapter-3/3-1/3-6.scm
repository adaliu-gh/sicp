(define rand-old
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))

(define rand
  (let ((x random-init))
    (define (new-random new-value)
      (set! x new-value))
    (define (generate)
      (set! x (rand-update x))
      x)
    (lambda (arg)
      (cond
       ((eq? arg 'generate) (generate))
       ((eq? 'reset) new-random)
       (else (error "xxx"))))))
