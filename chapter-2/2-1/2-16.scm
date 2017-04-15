(load "2-13.scm")
;; My new interval-arithmetic package

(define (my-add x y)
  (let ((xlower (lower-bound x))
        (xupper (upper-bound x))
        (ylower (lower-bound y))
        (yupper (upper-bound y)))
  (make-interval (+ xlower ylower) (+ xupper yupper))))

(define (my-sub x y)
  (let ((xlower (lower-bound x))
        (xupper (upper-bound x))
        (ylower (lower-bound y))
        (yupper (upper-bound y)))
    (make-interval (- xlower ylower) (- xupper yupper))))

(define (my-mul x y)
  (let ((xlower (lower-bound x))
        (xupper (upper-bound x))
        (ylower (lower-bound y))
        (yupper (upper-bound y)))
    (make-interval (* xlower ylower) (* xupper yupper))))

(define (my-div x y)
  (let ((xlower (lower-bound x))
        (xupper (upper-bound x))
        (ylower (lower-bound y))
        (yupper (upper-bound y)))
    (make-interval (/ xlower ylower) (/ xupper yupper))))

(define t1 i3)
(define t2 i4)
(define t3 i5)

(define zero (my-sub t1 t1) ) ;; => (0 . 0)
(define one (my-div t3 t3)) ;; => (1 . 1)

(define (par1 a b)
  (my-div (my-mul a b)
          (my-add a b)))
(define (par2 a b)
  (my-div
   one
   (my-add (my-div one a)
           (my-div one b))))

(equal? (par1 t1 t1) (par2 t1 t1));=> #t
(equal? (par1 t1 t2) (par2 t1 t2));=> #t
(equal? (par1 t1 t3) (par2 t1 t3));=> #t
(equal? (par1 t2 t1) (par2 t2 t1));=> #t
(equal? (par1 t2 t2) (par2 t2 t2));=> #t
(equal? (par1 t2 t3) (par2 t2 t3));=> #t
(equal? (par1 t3 t1) (par2 t3 t1));=> #t
(equal? (par1 t3 t2) (par2 t3 t2));=> #t
(equal? (par1 t3 t3) (par2 t3 t3));=> #t
(par1 (make-center-percent 12 0.03)
      (make-center-percent 34 0.0001))
;; => (8.67111975914069 . 9.064952613483912)
(par2 (make-center-percent 12 0.03)
      (make-center-percent 34 0.0001))
;; => (8.67111975914069 . 9.06495261348391)


(define (par3 a b c)
  (my-mul a (my-add c b)))
(define (par4 a b c)
  (my-add (my-mul a b)
          (my-mul a c)))
(equal? (par3 t1 t2 t3)
        (par4 t1 t2 t3))
;;=> #t
