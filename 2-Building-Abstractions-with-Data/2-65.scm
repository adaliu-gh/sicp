(load "2-64.scm")

(define (union-set.v1 set1 set2)
  (cond
   ((null? set1) set2)
   ((null? set2) set1)
   (else (let ((new-set (adjoin-set (entry set1) set2)))
           (union-set.v1 (left-branch set1)
                      (union-set.v1 (right-branch set1) new-set))) )) )

(define (union-set.v2 set1 set2)
  (cond
   ((null? set1) set2)
   ((null? set2) set1)
   (else
    (let ((e1 (entry set1))
          (e2 (entry set2))
          (l1 (left-branch set1))
          (l2 (left-branch set2))
          (r1 (right-branch set1))
          (r2 (right-branch set2)))
      (cond
       ((= e1 e2)
        (make-tree  e1 (union-set.v2 l1 l2) (union-set.v2 r1 r2)))
       ((< e1 e2)
        (union-set.v2 r1 (make-tree e2 (union-set.v2 (make-tree e1 l1 '()) l2) r2)))
       ((> e1 e2)
        (union-set.v2 l1 (make-tree e2 l2 (union-set.v2 (make-tree e1 '() r1) r2)))))))))

(define (intersection-set a b)
  (if (or (null? a) (null? b))
      '()
      (let ((new-set (union-set.v1 (intersection-set (left-branch a) b)
                                   (intersection-set (right-branch a) b))))
        (if (element-of-set? (entry a) b)
            (adjoin-set (entry a) new-set)
            new-set))))

(define (element-of-set? x set)
  (cond
   ((null? set) #false)
   ((= x (entry set)) #true)
   ((< x (entry set))
    (element-of-set? x (left-branch set)))
   (else
    (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (if (null? set)
      (make-tree x '() '())
      (let ((y (entry set)))
        (cond
         ((= x y) set)
         ((< x y)
          (make-tree y (adjoin-set x (left-branch set)) (right-branch set)))
         ((> x y)
          (make-tree y (left-branch set) (adjoin-set x (right-branch set))))))))



(define x (list->tree '(1 3 5 7 9 11)))
(define y (list->tree '(2 4 6 7 8 10 12)))
(define z (list->tree '( 1 5 8 11 20)))

(union-set.v1 x y)
;; => (7 (4 (2 (1 () ()) (3 () ())) (6 (5 () ()) ())) (10 (8 () (9 () ())) (12 (11 () ()) ())))
(union-set.v2 x y)
;; => (7 (4 (2 (1 () ()) (3 () ())) (6 (5 () ()) ())) (10 (8 () (9 () ())) (12 (11 () ()) ())))
(intersection-set x z)
;; => (11 (1 () (5 () ())) ())
