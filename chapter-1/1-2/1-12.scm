;; Pascal Triangle

;; Number Number -> Number
(define (tri-recur row col)
  (cond
   [(or (= col 0) (= row col)) 1]
   [else (+ (tri-recur (- row 1) ( - col 1))
            (tri-recur (- row 1) col))]))

(check-eq? (tri-recur 4 4) 1)
