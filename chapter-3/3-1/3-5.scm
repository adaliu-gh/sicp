(define (estimate-integral P x1 x2 y1 y2 trials)
  (* (rectangle-area x1 x2 y1 y2)
     (monte-carlo trials P)))

(define (monte-carlo trials experiment)
  (define (iter remaining passed)
    (cond
     ((= remaining 0)
      (/ passed trials))
     ((experiment)
      (iter (- remaining 1)
            (+ passed 1)))
     (else (iter (- remaining 1) passed))))
  (iter trials 0))

(define (in-unit-circle?)
  (let ((x (/ (random-in-range -100 100) 100))
        (y (/ (random-in-range -100 100) 100)))
    (<= (+ (* x x) (* y y)) 1)))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (rectangle-area x1 x2 y1 y2)
  (* (abs (- x1 x2))
     (abs (- y1 y2))))

;;=======================
(define (estimate-pi)
  (estimate-integral in-unit-circle? -1 1 -1 1 1000000))
;; (estimate-pi)
;; => 785891/250000 ~ 3.143564
