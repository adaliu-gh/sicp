(define (estimate-integral P x1 x2 y1 y2)
  (let ((area (* (- x2 x1) (- y2 y1))))
    (scale-stream (monte-carlo (stream-map P
                                           (random-range-numbers x1 x2)
                                           (random-range-numbers y1 y2)) 0 0)
                  area)))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (random-range-numbers low high)
  (cons-stream (random-in-range low high)
               (random-in-range low high)))
