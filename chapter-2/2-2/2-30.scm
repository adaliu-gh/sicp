(define (square-tree tree)
  (cond
   ((null? tree) tree)
   ((not (pair? (car tree)))
    (cons (square (car tree))
          (square-tree (cdr tree))))
   (else (cons (square-tree (car tree))
               (square-tree (cdr tree))))))

(define (square x) (* x x))

(define x (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))

(square-tree x)
;;=> (1 (4 (9 16) 25) (36 49))


;;========================

(define (square-tree.v2 tree)
  (map (lambda (subtree)
         (if (number? subtree)
             (square subtree)
             (square-tree.v2 subtree))) tree))

(square-tree.v2 x)
;; => (1 (4 (9 16) 25) (36 49))
