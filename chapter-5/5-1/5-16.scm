(define (make-new-machine)
  (let ((trace (make-register 'trace))
        (pc (make-register 'pc))
        (flag (make-register 'flag))
        (stack (make-stack))
        (the-instruction-sequence '()))

(define (execute)
  (let ((insts (get-contents pc)))
    (if (null? insts)
        'done
        (begin ((instruction-execution-proc (car insts)))
               (if (get-contents trace)
                   (display (instruction-text (car insts))))
               (execute)))))

(define (dispatch message)
  (cond ...
        ((eq? message 'trace-on)
         (set-contents! trace true))
        ((eq? message 'trace-off)
         (set-contents! trace false))
        ...))
