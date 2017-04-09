(define (fringe tree)
  (cond
   ((null? tree) tree)
   ((pair? (car tree))
    (append (fringe (car tree))
            (fringe (cdr tree))))
   (else
    (cons (car tree)
          (fringe (cdr tree))))))
(define x (list (list 1 2) (list 3 4)))
x
(fringe x)
;; => (1 2 3 4)
(fringe (list x x))
;; => (1 2 3 4 1 2 3 4)

;;========================
(define (fringe.v2 tree)
  (cond
   ((null? tree) tree)
   ((not (pair? tree)) (list tree))
   (else (append (fringe.v2 (car tree))
                 (fringe.v2 (cdr tree))))))
(fringe.v2 x)
;; => (1 2 3 4)
(fringe.v2 (list x x))
;; => (1 2 3 4 1 2 3 4)
