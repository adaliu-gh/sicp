(define (or-gate a1 a2 output)
  (let ((c1 (make-wire))
        (c2 (make-wire)))
    (inverter a1 c1)
    (inverter a2 c2)
    (and-gate c1 c2 output)))
;; delay time:
;; = (<= 1 x 2) inverter-delay + 1 and-delay
