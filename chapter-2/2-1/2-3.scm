(load "2-2.scm")

;;======================
;; AAAAAAAAAAAAAAAAAAAAAAAAAAA

;; Defining rectangles using segments
;; horiz represents the bottom-horizontal segment of the rectangle
;; vert represents the left-vertical segment of the rectangle
(define (make-rectangle horiz vert)
  (cons horiz vert))
(define (horiz-rect rect)
  (car rect))
(define (vert-rect rect)
  (cdr rect))

(define (rect-perimeter rect)
  (* 2 (+ (seg-length (horiz-rect rect))
          (seg-length (vert-rect rect)))))

(define (rect-area rect)
  (* (seg-length (horiz-rect rect))
     (seg-length (vert-rect rect))))

;;=================
;; Other Auxiliary Procedures
(define (seg-length segment)
  (let ((start (start-segment segment))
        (end (end-segment segment)))
    (sqrt (+ (square (- (x-point start) (x-point end)))
             (square (- (y-point start) (y-point end)))))))

(define (square x) (* x x))
