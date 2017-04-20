(define (add-poly p1 p2)
  (cond
   ((equ? (variable p1) (variable p2))
    (make-poly (variable p1) (add-terms (term-list p1) (term-list p2))))
   (else
    (append p1 p2))))
