(load "3-66.scm")

(define (all-pairs s t)
  (let ((paired (pairs s t)))
    (interleave
     paired
     (stream-map
      (lambda (pair) (list (cadr pair) (car pair))) paired))))
