(define (make-deque)
  (let ((fron-ptr '())
        (rear-ptr '()))

    ;; predicate
    (define (empty-deque?)
      (or (null? fron-ptr)
          (null? rear-ptr)))

    ;; mutators
    (define (fron-insert-deque! v)
      (let ((new-pair (list v '() '())))
        (cond
         ((empty-deque?)
          (set! fron-ptr new-pair)
          (set! rear-ptr new-pair))
         (else
          (set-cdr! (cdr new-pair) fron-ptr)
          (set! fron-ptr new-pair)))))
    (define (rear-insert-deque! v)
      (let ((new-pair (list v '() '())))
        (cond
         ((empty-deque?)
          (set! fron-ptr new-pair)
          (set! rear-ptr new-pair))
         (else
          (set-car! (cdr new-pair) rear-ptr)
          (set-cdr! (cdr rear-ptr) new-pair)
          (set! rear-ptr new-pair)))))
    (define (front-delete-deque!)
      (if (empty-deque?)
          (error "empty")
          (set! fron-ptr (cddr fron-ptr))))
    (define (rear-delete-deque!)
      (if (empty-deque?)
          (error "empty")
          (begin (set! rear-ptr (cadr rear-ptr))
                 (set-cdr! (cdr rear-ptr) '()))))

    (define (dispatch m)
      (cond
       ((eq? m 'fron-ptr) fron-ptr)
       ((eq? m 'rear-ptr) rear-ptr)
       ((eq? m 'fron-insert-deque!) fron-insert-deque!)
       ((eq? m 'rear-insert-deque!) rear-insert-deque!)
       ((eq? m 'front-delete-deque!) front-delete-deque!)
       ((eq? m 'rear-delete-deque!) rear-delete-deque!)
       ((eq? m 'empty-deque?) empty-deque?)))
    dispatch))

;; implementation
(define (empty-deque? q)
  ((q 'empty-deque?)))

;; selectors
(define (front-deque q)
  (if (empty-deque? q)
      (error "empty")
      (car (q 'fron-ptr))))
(define (rear-deque q)
  (if (empty-deque? q)
      (error "empty")
      (car (q 'rear-ptr))))

;; mutators
(define (fron-insert-deque! d v)
  ((d 'fron-insert-deque!) v) d)
(define (rear-insert-deque! d v)
  ((d 'rear-insert-deque!) v) d)
(define (front-delete-deque! d)
  ((d 'front-delete-deque!)) d)
(define (rear-delete-deque! d)
  ((d 'rear-delete-deque!)) d)

;; print
(define (print-deque d)
  (let ((l (d 'fron-ptr)))
    (define (recur remaining)
      (if (null? (car remaining))
          '()
          (cons (car remaining)
                (recur (cddr remaining)))))
    (recur l)))

