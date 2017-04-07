(define (square-list.v1 items)
  (if (null? items)
      items
      (cons (square (car items))
            (square-list.v1 (cdr items)))))

(define (square-list.v2 items)
  (map square items))

(square-list.v1 (list 1 2 3 5))
;; => (1 4 9 25)
(square-list.v2 (list 1 2 3 5))
;; => (1 4 9 25)
;;====================
(define (square x) (* x x))
