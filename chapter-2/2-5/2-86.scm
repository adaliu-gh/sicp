;; change all sine to generic sine
;; all cosine to generic cosine
;; all + to generic add
;; all - to generic sub
;; all * to generic mul
;; all / to generic div

(define (install-real-complex-package)
  (define (make-real-complex x y)
    (cons x y))
  (define (real-part z)
    (car z))
  (define (imag-part z)
    (cadr z))
  (define (mag-part z)
    (sqrt (add (expt (real-part z) 2) (expt (imag-part z) 2))))
  (define (angle-part z)
    (atan (div (imag-part z) (real-part z))))

  ;; interface procedures
  (define (tag x) (attach-tag 'real-complex))
  (put 'make-real-complex '(any any)
       (lambda (x y)
         (tag (make-real-complex x y))))
  (put 'real-part 'real-complex real-part)
  (put 'imag-part 'real-complex imag-part)
  (put 'mag-part 'real-complex
       mag-part)
  (put 'angle-part 'real-complex
       angle-part))

;; (define (install-mag-complex-package) ...)

(define (make-real-complex x y)
  ((get 'make-real-complex '(any any)) x y))
(define (make-mag-complex x y)
  ((get 'make-mag-complex '(any any)) x y))

(define (install-complex-package)
  ;; internal procedures
  (define (make-real-complex x y)
    ((get 'make-real-complex '(any any)) x y))
  (define (make-mag-complex x y)
    ((get 'make-mag-complex '(any any)) x y))
  (define (add-complex x y)
    (make-real-complex (add (real-part x) (real-part y))
                       (add (imag-part x) (imag-part y))))

  ...
  ;; interface procedures
  (define (tag x) (attach-tag 'complex))
  (put 'add 'complex (lambda (x y) (tag (add-complex x y))))
  ...)
