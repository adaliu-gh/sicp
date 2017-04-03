#lang sicp

(define (double proc)
  (lambda (x)
    (proc (proc x))))

(((double (double double)) inc) 5)
;; => 21
