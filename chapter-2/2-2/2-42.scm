(load "2-41.scm")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions) (safe? k positions))
                (flatmap
                 (lambda (rest-of-queens)
                   (map (lambda (new-row)
                          (adjoin-positions
                           new-row k rest-of-queens))
                        (enumerate-interval 1 board-size)))
                 (queen-cols (- k 1))))))
  (remove-same (queen-cols board-size) ))

(define empty-board '())

(define (safe? k positions)
  (define final-col (car positions))
  (define (iter count cols)
    (cond
     ((null? cols) #t)
     ((or
       (= (car cols) final-col)
       (= (car cols) (- final-col count))
       (= (car cols) (+ final-col count)))
      #f)
     (else (iter (+ count 1) (cdr cols)))))
  (iter 1 (cdr positions)))

(define (adjoin-positions new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define (remove-same positions)
  (cond
   ((null? positions) positions)
   ((accumulate (lambda (x y)
                  (or (equal? (reverse (car positions) ) x) y )) #f
                  (cdr positions))
    (remove-same (cdr positions)))
   (else (cons (car positions)
               (remove-same (cdr positions))))))

(define (last list)
  (if (null? (cdr list))
      (car list)
      (last (cdr list))))

(queens 1)
;; => ((1))
(queens 2)
;; => ()
(queens 3)
;; => ()
(queens 4)
;; => ((2 4 1 3))
(queens 6)
;; => ((3 6 2 5 1 4) (2 4 6 1 3 5))
(queens 8)
;; => ((1 7 4 6 8 2 5 3) (2 7 5 8 1 4 6 3) (1 7 5 8 2 4 6 3) (2 5 7 4 1 8 6 3) (2 7 3 6 8 5 1 4) (1 5 8 6 3 7 2 4) (3 6 8 1 5 7 2 4) (2 5 7 1 3 8 6 4) (3 6 2 5 8 1 7 4) (2 8 6 1 3 5 7 4) (3 6 2 7 5 1 8 4) (3 7 2 8 6 4 1 5) (4 2 7 3 6 8 1 5) (1 6 8 3 7 4 2 5) (3 8 4 7 1 6 2 5) (4 6 8 2 7 1 3 5) (2 6 1 7 4 8 3 5) (2 4 6 8 3 1 7 5) (3 6 8 2 4 1 7 5) (4 8 1 3 6 2 7 5) (2 6 8 3 1 4 7 5) (3 6 2 7 1 4 8 5) (4 7 3 8 2 5 1 6) (4 8 5 3 1 7 2 6) (3 5 8 4 1 7 2 6) (4 2 8 5 7 1 3 6) (5 7 2 4 8 1 3 6) (5 1 8 4 2 7 3 6) (4 1 5 8 2 7 3 6) (5 2 8 1 4 7 3 6) (3 7 2 8 5 1 4 6) (3 1 7 5 8 2 4 6) (3 5 2 8 1 7 4 6) (3 5 7 1 4 2 8 6) (5 2 4 6 8 3 1 7) (6 3 5 8 1 4 2 7) (5 8 4 1 3 6 2 7) (4 2 5 8 6 1 3 7) (4 6 1 5 2 8 3 7) (6 3 1 8 5 2 4 7) (5 3 1 6 8 2 4 7) (4 2 8 6 1 3 5 7) (6 3 5 7 1 4 2 8) (6 4 7 1 3 5 2 8) (4 7 5 2 6 1 3 8) (5 7 2 6 3 1 4 8))
