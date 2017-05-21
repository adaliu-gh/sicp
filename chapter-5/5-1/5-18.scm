(define (make-register name)
  (let ((contents '*unassigned*)
        (trace false)
        (reg-name name))
    (define (set value)
      (let ((old contents))
        (set! contents value)
        (if trace
            (begin (newline)
                   (display
                    (list 'name '= reg-name
                          'old-value '= old
                          'new-value '= value))))))
    (define (dispatch message)
      (cond ((eq? message 'get) contents)
            ((eq? message 'set) set)
            ((eq? message 'trace-on)
             (set-contents! trace true))
            ((eq? message 'trace-off)
             (set-contents! trace false))
            (else error "xxx" message)))
    dispatch))
