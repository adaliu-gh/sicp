
(define (cont-frac n d k)

  (define (iter k result)
    (if (zero? k) result
        (iter (sub1 k) (/ (n k)
                          (+ (d k) result)))))

  (iter k 0))

 (cont-frac (lambda (i) 1.0)
            (lambda (i) 1.0)
            4)
;; => 0.6180339901755971

;;========================
;; a

(define (diff k)
  (abs (- (cont-frac (lambda (i) 1)
                     (lambda (i) 1) k)
          (/ 6180 10000))))

(define (approx-4-sub1imals)
  (define (iter k)
    (if (< (abs (- (cont-frac (lambda (i) 1)
                              (lambda (i) 1) k)
                   0.6180)) 0.00001)
        k
        (iter (add1 k))))
  (iter 1))

;;========================
;; b

(define (cont-frac/recursive n d k)

  (define (recur i)
    (if (> i k) 1
        (/ (n i)
           (+ (d i) (recur (add1 i))))))

  (recur 1))

(cont-frac/recursive (lambda (i) 1.0)
                     (lambda (i) 1.0)
                     20)

;; => 0.6180339901755971
