(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(define (f n) (A 0 n)) ;; f = 2n
(define (g n) (A 1 n)) ;; g = 2^n
(define  (h n) (A 2 n)) ;; h = 2 ^ (2 ^ (2 ^ (2 ^ .. 2))) there are n 2s
                                        ; or h = (expt 2 (expt 2 (expt 2 ... (expt 2 2)))) -> there are n 2s
(define (k n) (* 5 n n)) ;; k = 5*n^2
