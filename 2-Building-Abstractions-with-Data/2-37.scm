(load "2-36.scm")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose m)
  (accumulate-n cons '() m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (map (lambda (col)
                  (dot-product row col))
                cols)) m)))

;;===============================
;; TEST

(define v (list 1 2 3 4))
(define w (list 1 2 3 4))
;; (dot-product v w)
;; => 30

(define m (list (list 1 2 3 4) (list 1 1 1 1)))
;; (matrix-*-vector m v)
;; => (30 10)

;; (transpose m)
;; => ((1 1) (2 1) (3 1) (4 1))

(define n (list (list 1 1) (list 1 1) (list 1 1) (list 1 1)))
;; (transpose n)
;; => ((1 1 1 1) (1 1 1 1))
;; (matrix-*-matrix m n)
;; => ((10 10) (4 4))
