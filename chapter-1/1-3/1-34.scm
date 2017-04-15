(define (f g)
  (g 2))

(f f)
;; => error:
;;    application: not a procedure;
;;    expected a procedure that can be applied to arguments
;;    given: 2
