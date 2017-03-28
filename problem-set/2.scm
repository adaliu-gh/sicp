
;;===========================
;; 2.1

(define slow-mul
  (lambda (a b)
    (cond
     ((= b 0) 0)
     (else (+ a (slow-mul a (sub1 b)))))))

(define plus
  (lambda (a b)
    (if (zero? b)
        a
        (plus (inc a) (dec b)))))


;;=========================
;; 2.2

(define simple-log
  (lambda (n)
    (if (= n 1) 0
        (+ (simple-log (/ n 2)) 1))))

(define (odd? x)
  (cond
   ((zero? x) #f)
   ((= x 1) #t)
   (else (odd? (- x 2)))))

(define slow-mul-recurse
  (lambda (a b)
    (cond
     ((= b 0) 0)
     (else (+ a (slow-mul-recurse a (- b 1)))))))

(define slow-mul-iter
  (lambda (a b)
    (mul-iter/helper 0 a b)))

(define (mul-iter/helper x a b)
  (if (zero? b)
      x
      (mul-iter/helper (+ x a) a (- b 1))))

(define fast-mul
  (lambda (a b)
    (define (fast-mul/helper x a b)
      (cond
       ((= b 0) x)
       ((even? b) (fast-mul/helper x (double a) (halve b)))
       (else (fast-mul/helper (+ x a) a (- b 1)))))
    (fast-mul/helper 0 a b)))

(define (fast-exp a b)
  (define (fast-exp/helper x a b)
    (cond
     ((zero? b) x)
     ((even? b) (fast-exp/helper x (* a a) (/ b 2)))
     (else (fast-exp/helper (* x a) a (- b 1)))))
  (fast-exp/helper 1 a b))

;;====================
;; 2.3

(define (boolean-odd? x)
  (and (not (= x 0))
       (or (= x 1)
           (boolean-odd? (- x 2)))))

(define (boolean-odd?.v2 x)
  (or (= x 1)
      (and (not (= x 0))
           (boolean-odd?.v2 (- x 2)))))

(define sum-by-halves
  (lambda (a b)
    (cond
     ((= a b) a)
     (else
      (+ (sum-by-halves a (floor (/ (+ a b) 2)))
         (sum-by-halves (+ 1 (floor (/ (+ a b) 2)) ) b))))))

(define clarity
  (lambda (a b)
    (cond
     ((> a b) 0)
     ((= a b) a )
     (else (+ a (clarity (+ a 1) b)) ))))
