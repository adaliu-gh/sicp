(require rackunit)
(load "2-10.scm")

(define (mul-interval/cond x y)
  (let ((xlower (lower-bound x))
        (xupper (upper-bound x))
        (ylower (lower-bound y))
        (yupper (upper-bound y)))
    (cond
     [(and (< xlower 0) (< xupper 0))
      (cond
       [(and (< ylower 0) (< yupper 0) )
        (make-interval (* xupper yupper) (* xlower ylower))]
       [(and (< ylower 0) (> yupper 0))
        (make-interval (* xlower yupper) (* xlower ylower))]
       [(and (> ylower 0) (> yupper 0) )
        (make-interval (* xlower yupper) (* xupper ylower))])]
     [(and (> xlower 0) (> xupper 0))
      (cond
       [(and (< ylower 0) (< yupper 0))
        (make-interval (* xupper ylower) (* xlower yupper))]
       [(and (< ylower 0) (> yupper 0))
        (make-interval (* xupper ylower) (* xupper yupper))]
       [(and (> ylower 0) (> yupper 0))
        (make-interval (* xlower ylower) (* xupper yupper))])]
     [(and (< xlower 0) (> xupper 0))
      (cond
       [(and (< ylower 0) (< yupper 0))
        (make-interval (* xupper ylower) (* xlower ylower))]
       [(and (> ylower 0) (> ylower 0))
        (make-interval (* xlower yupper) (* xupper yupper))]
       [(and (< ylower 0) (> yupper 0))
        (make-interval (min (* xlower yupper) (* xupper ylower))
                       (max (* xlower ylower) (* xupper yupper)))])])))

;; test
(define i3 (make-interval -3 -2))
(define i4 (make-interval -3 3))
(define i5 (make-interval 2 3))


(check-equal? (mul-interval/cond i3 i3) (mul-interval i3 i3))
(check-equal? (mul-interval/cond i3 i4) (mul-interval i3 i4))
(check-equal? (mul-interval/cond i3 i5) (mul-interval i3 i5))
(check-equal? (mul-interval/cond i4 i3) (mul-interval i4 i3))
(check-equal? (mul-interval/cond i4 i4) (mul-interval i4 i4))
(check-equal? (mul-interval/cond i4 i5) (mul-interval i4 i5))
(check-equal? (mul-interval/cond i5 i3) (mul-interval i5 i3))
(check-equal? (mul-interval/cond i5 i4) (mul-interval i5 i4))
(check-equal? (mul-interval/cond i5 i5) (mul-interval i5 i5))

;; all test past


;;==============================
;; change data representation

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
