(load "2-7.scm")

(define (sub-interval x y)
  (let ((xlower (lower-bound x))
        (xupper (upper-bound x))
        (ylower (lower-bound y))
        (yupper (upper-bound y)))
  (make-interval (- xlower ylower) (- xupper yupper))))


