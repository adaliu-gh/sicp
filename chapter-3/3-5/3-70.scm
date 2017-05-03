(load "stream.scm")

(define (weighted-pairs s t weight)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (merge-weighted
    (stream-map
     (lambda (x) (list (stream-car s) x)) (stream-cdr t))
    (weighted-pairs
     (stream-cdr s) (stream-cdr t) weight)
    weight)))

(define (merge-weighted s t weight)
  (let ((s0 (stream-car s))
        (t0 (stream-car t)))
    (cond ((<= (weight s0) (weight t0))
           (cons-stream s0 (merge-weighted (stream-cdr s) t weight)))
          ((> (weight s0) (weight t0))
           (cons-stream t0 (merge-weighted s (stream-cdr t) weight))))))

(define (sum-pair pair)
  (+ (car pair) (cadr pair)))

;; A
(define weight-from-sum
  (weighted-pairs integers integers sum-pair))

;; B

(define (divisible-by235? pair)
  (define (divide? a b)
    (= 0 (remainder a b)))
  (let ((x (car pair))
        (y (cadr pair)))
    (or (divide? x 2)
        (divide? x 3)
        (divide? x 5)
        (divide? y 2)
        (divide? y 3)
        (divide? y 5))))

(define b
  (stream-filter
   (lambda (pair) (not (divisible-by235? pair)))
   (weighted-pairs integers integers
                   (lambda (x) (+ (* 2 (car x))
                                  (* 3 (cadr x))
                                  (* 5 (car x) (cadr x))))) ))
