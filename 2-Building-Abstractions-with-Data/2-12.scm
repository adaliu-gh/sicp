(load "2-11.scm")

(define (make-center-percent center percent)
  (let ((width (* center percent)))
    (make-center-width center width)))
(define (percent i)
  (/ (width i) (center i)))
