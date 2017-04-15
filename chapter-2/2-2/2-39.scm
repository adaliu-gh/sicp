(load "2-38.scm")
(define (reverse.r sequence)
  (define (put-at-end item items)
    (if (null? items)
        (list item)
        (cons (car items) (put-at-end item (cdr items)))))
  (fold-right (lambda (x y)
                (put-at-end x y)) '() sequence))

(define (reverse.l sequence)
  (fold-left (lambda (x y)
               (cons y x)) '() sequence))

;;=====================
;; TEST

;; (reverse.l (list 1 2 3 4))
;; => (4 3 2 1)
;; (reverse.r (list 1 2 3 4))
;; => (4 3 2 1)
