(load "../1-Building-Abstractions-with-Procedures/1-22.scm")
(load "2-33.scm")

(define (unique-pairs max n)
  (if (= n 0)
      (list '())
      (flatmap
       (lambda (x)
              (map (lambda (y)
                          (cons y x))
                   (enumerate-interval (+ (first x) 1) max)))
       (unique-pairs max (- n 1)))))

;; (unique-pairs 6 3)

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n 2))))

;;=====================

(define (first list)
  (if (null? list)
      0
      (car list)))

(define (enumerate-interval start end)
  (if (> start end)
      '()
      (cons start (enumerate-interval (+ 1 start) end))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

;; (prime-sum-pairs 6)
;; => ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11))
