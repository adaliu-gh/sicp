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

;;=========================
;; VARIABLE
(define (atom? exp)
  (or (symbol? exp)
      (number? exp)))

(define (constant? exp var)
  (and (atom? exp)
       (not (eq? exp var))))

(define (same-variable? exp var)
  (and (atom? exp)
       (eq? exp var)))

;;========================
;; SUM
(define (sum? exp)
  (and (pair? exp)
       (eq? (car exp) '+)))

(define (make-sum a1 a2)
  (cond
   ((and (number? a1) (number? a2))
    (+ a1 a2))
   ((eq? a1 0) a2)
   ((eq? a2 0) a1)
   (else
    (list '+ a1 a2))))

(define (addend exp)
  (cadr exp))

(define (augend exp)
  (caddr exp))

;;=======================
;; PRODUCT
(define (product? exp)
  (and (pair? exp)
       (eq? (car exp) '*)))

(define (make-product a1 a2)
  (cond
   ((and (number? a1) (number? a2))
    (* a1 a2))
   ((or (eq? a1 0)
        (eq? a2 0))
    0)
   ((eq? a1 1) a2)
   ((eq? a2 1) a1)
   (else (list '* a1 a2))))


(define (multiplier exp)
  (cadr exp))

(define (multiplied exp)
  (caddr exp))


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
