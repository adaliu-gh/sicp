;; Definition of Segment
(define (make-segment start end)
  (cons start end))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))

;; Definition of Point
(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

;; Segment -> Point
;; returns the midpoint of a segment
(define (mid-point segment)
  (let ((start (start-segment segment))
        (end (end-segment segment)))
    (make-point
     (average (x-point start) (x-point end))
     (average (y-point start) (y-point end)))))


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;;======================
;; Other Auxiliary Procedures
(define (average x y)
  (/ (+ x y) 2))
