(load "2-48.scm")

;;==================================
;; A
(define outline-painter
  (lambda (frame)
    (let ((origin (make-vect 0 0))
          (p1 (make-vect 0 1))
          (p2 (make-vect 1 0))
          (opposite-origin (make-vect 1 1)))
      ((segments->painter (list (make-segment origin p1)
                                (make-segment origin p2)
                                (make-segment p1 opposite-origin)
                                (make-segment p2 opposite-origin)))
       frame))))


;;===================================
;; B

(define x-painter
  (lambda (frame)
    (let ((origin (make-vect 0 0))
          (p1 (make-vect 1 0))
          (p2 (make-vect 0 1))
          (opposite-origin (make-vect 1 1)))
      ((segments->painter (list (make-segment origin opposite-origin)
                                (make-segment p1 p2)))
       frame))))

;;=======================================
;; C

(define diamond-painter
  (lambda (frame)
    (let ((p1 (make-vect 0 0.5))
          (p2 (make-vect 0.5 1))
          (p3 (make-vect 1 0.5))
          (p4 (make-vect 0.5 0)))
      ((segments->painter (list (make-segment p1 p2)
                                (make-segment p2 p3)
                                (make-segment p3 p4)
                                (make-segment p4 p1)))
       frame))))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame)
         (start-segment segment))
        ((frame-coord-map frame)
         (end-segment segment))))
     segment-list)))


