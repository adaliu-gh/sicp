(load "2-8.scm")

(define (width interval)
  (/ (- (upper-bound interval)
        (lower-bound interval)) 2))

(define i1 (make-interval 1 2))
(define i2 (make-interval 4 6))

(define width-i1 (width i1))
width-i1 ;; => 1/2
(define width-i2 (width i2))
width-i2 ;; => 1
(define width-i1+i2 (width (add-interval i1 i2)))
width-i1+i2 ;; => 3/2 (= width-i1 + width-i2)
(define width-i1-i2 (width (sub-interval i1 i2)))
width-i1-i2 ;; => -1/2 (= width-i1 - width-i2)
(define width-i1*i2 (width (mul-interval i1 i2)))
width-i1*i2 ;;=> 5
(define width-i1/i2 (width (div-interval i1 i2)))
width-i1/i2 ;;=> 0.9166666666666666

