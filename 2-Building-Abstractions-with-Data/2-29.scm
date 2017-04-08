;;=========================
;; A
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car (cdr branch)))

;; e.x.
(define m1 (make-mobile (make-branch 10 20)
                        (make-branch 5
                                     (make-mobile
                                      (make-branch 5 20) (make-branch 5 20)))))
(define m2 (make-mobile (make-branch 11 20)
                        (make-branch 5
                                     (make-mobile
                                      (make-branch 5 20) (make-branch 5 20)))))
;;=============================
;; B

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile) )
     (branch-weight (right-branch mobile))))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (number? structure)
        structure
        (total-weight structure))))

(total-weight m1)
;; => 60
(total-weight m2)
;; => 60

;;===========================
;; C

(define (balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
  (and
   (balanced-branch? left)
   (balanced-branch? right)
   (= (branch-product left)
      (branch-product right)))))

(define (balanced-branch? branch)
  (let ((structure (branch-structure branch)))
    (if (number? structure)
        #t
        (balanced? structure))))

(define (branch-product branch)
  (* (branch-length branch)
     (branch-weight branch)))

(balanced? m1)
;;=> #t
(balanced? m2)
;; => #f

;;===========================
;; D

(define (make-mobile.v2 left right) (cons left right))
(define (make-branch.v2 length structure) (cons length structure))

;;================
;; only change

(define (left-branch.v2 mobile)
  (car mobile))
(define (right-branch.v2 mobile)
  (cdr mobile))

(define (branch-length.v2 branch)
  (car branch))
(define (branch-structure.v2 branch)
  (cdr branch))
