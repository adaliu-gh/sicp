(define (make-monitored proc)
  (let ((counter 0))
    (define (dispatch arg)
      (cond
       ((eq? arg 'how-many-calls?) counter)
       ((eq? arg 'reset-count)
        (begin (set! counter 0) counter))
       (else (begin
               (set! counter (+ counter 1))
               (proc arg)))))
    dispatch))
