(load "2-50.scm")

(define (below painter1 painter2)
  (let ((split-point (make-vect 0 0.5)))
    (let ((painter-bottom
           (transform-painter painter1
                              (make-vect 0 0)
                              (make-vect 1 0)
                              split-point))
          (painter-top
           (transform-painter painter2
                              split-point
                              (make-vect 1 0.5)
                              (make-vect 0 1))))
      (lambda (frame)
        (painter-bottom frame)
        (painter-top frame)))))


(define (below.v1 painter1 painter2)
  (rotate90 (beside (rotate-counterclock-270 painter1)
                    (rotate-counterclock-270 painter2))))
