(define (make-new-machine)
  (let ((pc (make-register 'pc))
        (ic (make-register 'ic))
        ... )

  (define (execute)
    (let ((insts (get-contents pc)))
      (if (null? insts)
          'done
          (begin ((instruction-execution-proc (car insts)))
                 (set-contents! ic (+ 1 (get-contents ic)))
                 (execute)))))


  (define (dispatch message)
    (cond ...
          ((eq? message 'reset-count)
           (set-contents! ic 0))))
  ...))
