(load "2-40.scm")

(define (ordered-triple n s)
  (filter
   (lambda (triple)
     (= s (accumulate + 0 triple)))
   (unique-pairs n 3)))

(ordered-triple 6 10)
;; => ((6 3 1) (5 4 1) (5 3 2))

(define (ordered-integers max sum n)
  (filter (lambda (integers)
            (= sum (accumulate + 0 integers)))
          (unique-pairs max n)))

(define (ordered-triple.v2 n s)
  (ordered-integers n s 3))

(ordered-triple.v2 6 10)
;; => ((6 3 1) (5 4 1) (5 3 2))

(ordered-integers 4 3 2)
;; => ((2 1))
