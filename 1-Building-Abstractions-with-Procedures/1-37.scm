#lang sicp

(define (cont-frac n d k)

  (define (iter k result)
    (if (zero? k) result
        (iter (dec k) (/ (n k)
                          (+ (d k) result)))))

  (iter k 1))

 (cont-frac (lambda (i) 1.0)
            (lambda (i) 1.0)
            20)
;; => 1.618033988749895

;;========================
;; a

(define (diff k)
  (abs (- (cont-frac (lambda (i) 1)
                     (lambda (i) 1) k)
          (/ 6180 10000))))

(define (approx-4-decimals)
  (define (iter k)
    (if (< (abs (- (cont-frac (lambda (i) 1)
                              (lambda (i) 1) k)
                   0.6180)) 0.00001)
        k
        (iter (inc k))))
  (iter 1))

;;========================
;; b

(define (cont-frac/recursive n d k)

  (define (recur i)
    (if (> i k) 1
        (/ (n i)
           (+ (d i) (recur (inc i))))))

  (recur 1))

(cont-frac/recursive (lambda (i) 1.0)
                     (lambda (i) 1.0)
                     20)

;; => 0.6180339901755971
