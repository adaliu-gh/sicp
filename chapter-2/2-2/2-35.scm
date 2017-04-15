(load "2-33.scm")

(define (count-leaves t)
  (accumulate (lambda (x y) (+ x y))
              0
              (map (lambda (st)
                     (if (pair? st)
                         (count-leaves st)
                         1))
                   t)))

(count-leaves (list 1 (list 2 3) 4))
;; => 4
(count-leaves (list 1 2 3 4 (list 2 3 4 5) (list 4 5)))
;; => 10
