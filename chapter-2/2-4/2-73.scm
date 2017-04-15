;; b
(define (install-add-deriv-package)
  ;; internal procedures
  (define (make-sum x y) (cons x y))
  (define (addend exp) (car exp))
  (define (augend exp) (cadr exp))
  (define (add exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))

  ;;interfaces
  (define (tag x) (attach-tag '+ x))
  (put 'deriv '+ add)
  (put 'make-sum '+
       (lambda (x y) (tag (make-sum x y)))))

(define (install-mul-deriv-package)
  ;; internal procedures
  (define (make-mul x y) (cons x y))
  (define (multiplier x) (car x))
  (define (multiplied y) (cadr y))
  (define (mul exp var)
    (+ (* (multiplier exp)
          (deriv (multiplied exp)))
       (* (multiplied exp)
          (deriv (multiplier exp)))))

  ;; interfaces
  (define (tag x) (attach-tag '* x))
  (put 'deriv '*  mul)
  (put 'make-mul '*
       (lambda (x y) (tag (make-mul x y)))))

(define (make-sum x y)
  ((get 'make-sum '+)  x y))
(define (make-mul x y)
  ((get 'make-mul '*) x y))


;; d - just change the order of 'deriv and the symbol of operator in put

;;=========================

(define (deriv exp var)
  (cond
   ((number? exp) 0)
   ((variable? exp) (if (same-variable? exp var) 1 0))
   (else ((get 'deriv (operator exp)
               (operands exp) var)))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))


(define (variable? exp) (symbol? exp))
(define (same-variable? v1 v2)
  (eq? v1 v2))


