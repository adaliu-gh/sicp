(define (make-accumulator initial)
  (lambda (add)
    (begin (set! initial (+ initial add))
           initial)))
