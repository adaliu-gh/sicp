(load "3-66.scm")
(define (louis-pairs s t)
  (interleave
   (stream-map (lambda (x) (list (stream-car s) x))
               t)
   (louis-pairs (stream-cdr s) (stream-cdr t))))

;; infinite loop with no delay in the expression body
