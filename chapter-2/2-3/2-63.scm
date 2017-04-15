(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (iter tree result)
    (if (null? tree)
        result
        (iter (left-branch tree)
              (cons (entry tree)
                    (iter (right-branch tree) result)))))
  (iter tree '()))

;; (define x (make-tree 5
                     ;;(make-tree 3 (make-tree 1 '() '()) '())
                     ;;(make-tree 8 (make-tree 6 '() '()) (make-tree 9 '() '()))))

;; (tree->list-1 x)
;; => (1 3 5 6 8 9)
;; (tree->list-2 x)
;; => (1 3 5 6 8 9)

;;========================
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))
