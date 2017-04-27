(define (ripple-carry-adder ak bk sk c)
  (define (iter a b s carry)
    (if (= 1 (length a))
        (full-adder (car a) (car b) carry (car s) c)
        (let ((new-carry (make-wire)))
          (full-adder (car a) (car b) carry (car s) new-carry))))
  (iter ak bk sk (make-wire)))


;; half-adder delay: (2 and + 1 inverter)
;; full-adder delay: (2 * half + 1 or) = (5 and 1 or 2 inverter) = (6 and/or 2 inverter)
;; n ripple-carry-adder: (n * full) = (6n and/or, 2n inverter)
