(define (split combine combine-smaller)
  (define (recur painter n)
    (if (= n 0)
        painter
        (let ((smaller (recur painter (- n 1))))
          (combine painter (combine-smaller smaller smaller)))))
  recur)

(define right-split (split beside below))
(define up-split (split below beside))
