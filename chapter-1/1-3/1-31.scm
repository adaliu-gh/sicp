;;===========================
;; a
(define (product term a next b)
  (cond
   [(> a b) 1]
   [else (* (term a)
            (product term (next a) next b))]))

(define (pi-approx end)
  (define (add-2 x) (+ x 2))
  (* (/ 2 end) (/ (product (lambda (x) (expt x 2)) 2 add-2 end)
                  (product (lambda (x) (expt x 2)) 3 add-2 end))))

(exact->inexact (pi-approx 100))
;; => 3.157339689217565
(exact->inexact (pi-approx 1000))
;; => 3.143163842419198
(exact->inexact (pi-approx 10000))
;; => 3.1417497371492673
(exact->inexact (pi-approx 100000))
;; => 3.141608361592331


;;============================
;; b

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (pi-approx-iter end)
  (define (add-2 x) (+ x 2))
  (* (/ 2 end) (/ (product-iter (lambda (x) (expt x 2)) 2 add-2 end)
                  (product-iter (lambda (x) (expt x 2)) 3 add-2 end))))

(exact->inexact (pi-approx-iter 100))
;; => 3.157339689217565
