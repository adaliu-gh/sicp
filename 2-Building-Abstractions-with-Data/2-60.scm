(define (element-of-set? x set)
  (pair? (memq x set)))

(define (adjoin-set x set)
  (cons x set))

(define (intersection-set set1 set2)
  (cond
   ((null? set1) '())
   ((element-of-set? (car set1) set2)
    (cons (car set1) (intersection-set (cdr set1) set2)))
   (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (append set1 set2))
