(define (subsets s)
  (if (null? s)
      (list s)
      (let ((rest (subsets (cdr s))))
        (append rest
                (map (lambda (x)
                       (cons (car s) x)) rest)))))

(subsets (list 1 2 3))
;; => (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
(subsets (list 23 453 1 0))
;; => (() (0) (1) (1 0) (453) (453 0) (453 1) (453 1 0) (23) (23 0) (23 1) (23 1 0) (23 453) (23 453 0) (23 453 1) (23 453 1 0))
