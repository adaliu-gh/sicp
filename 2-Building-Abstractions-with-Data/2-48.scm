(load "2-47.scm")

(define (make-segment start end)
  (cons start end))
(define (start-segment seg)
  (car seg))
(define (end-segment end)
  (cdr seg))
