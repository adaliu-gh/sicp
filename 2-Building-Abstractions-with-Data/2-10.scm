(load "2-9.scm")

(define (div-interval-check-zero x y)
  (let ((ylower (lower-bound y))
        (yupper (upper-bound y)))
    (if (= ylower yupper)
        (error "the divider is a zero interval")
        (div-interval x y))))

;; (div-interval-check-zero i1 (make-interval 1 1))
;; ERROR: the divider is a zero interval
(div-interval-check-zero i1 i2)
;; => (0.16666666666666666 . 2.0)
