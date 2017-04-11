
(define (deriv exp var)
  (cond
   ((constant? exp var) 0)
   ((same-variable? exp var) 1)
   ((sum? exp)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
   ((product? exp)
    (make-sum (make-product (multiplier exp)
                            (deriv (multiplied exp) var))
              (make-product (deriv (multiplier exp) var)
                            (multiplied exp))))
   ((exponentiation? exp)
    (make-product (exponent exp)
                  (make-product (make-exponentiation (base exp)
                                                     (- (exponent exp) 1))
                                (deriv (base exp) var))))
   (else
    (error "unknown expression type: DERIV" exp))))

;;============
;; TWO ARGUMENTS

(define (sum? exp)
  (and (pair? exp)
       (eq? (cadr exp) '+)))
(define (addend exp)
  (car exp))
(define (augend exp)
  (caddr exp))

(define (product? exp)
  (and (pair? exp)
       (eq? (cadr exp) '*)))
(define (multiplier exp)
  (car exp))
(define (multiplied exp)
  (caddr exp))

;;============================
;; MORE COMPLICATED

(define (sum? exp)
  (pair? (memq '+ exp)))
(define (addend exp)
  (define (iter exp result)
    (if (eq? '+ (car exp))
        result
        (iter (cdr exp) (cons (car exp) result))))
  (iter exp '()))
(define (augend exp)
  (cdr (memq '+ exp)))



(define (product? exp)
  (and (pair? exp)
       (pair? (memq '* exp))
       (boolean? (memq '+ exp))))
(define (multiplier exp)
  (define (iter exp result)
    (if (eq? '* (car exp))
        result
        (iter (cdr exp) (cons (car exp) result))))
  (iter exp '()))
(define (multiplied exp)
  (let ((result (cdr (memq '* exp))))
    (if (and (pair? (car result))
             (null? (cdr result)))
        (car result)
        result)))

;;======================
;; EXPONENTIATION

(define (exponentiation? exp)
  (and (pair? exp)
       (eq? (car exp) '**)))

(define (make-exponentiation base exponent)
  (cond
   ((eq? exponent 0) 1)
   ((eq? exponent 1) base)
   (else (list '** base exponent))))

(define (base exp)
  (cadr exp))

(define (exponent exp)
  (caddr exp))
