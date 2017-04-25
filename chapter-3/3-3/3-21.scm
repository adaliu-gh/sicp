;;============================
(define (make-queue)
  (cons '() '()))
(define (fron-ptr queue)
  (car queue))
(define (set-fron-ptr! queue new)
  (set-car! queue new))
(define (rear-ptr queue)
  (cdr queue))
(define (set-rear-ptr! queue new)
  (set-cdr! queue new))

(define (empty-queue? queue)
  (null? (fron-ptr queue)))
(define (fron-queue queue)
  (if (empty-queue? queue)
      (error "the queue is empty")
      (car (fron-ptr queue))))
(define (insert-queue! queue item)
  (let ((new-item (cons item '())))
    (cond
     ((empty-queue? queue)
      (begin (set-fron-ptr! queue new-item)
             (set-rear-ptr! queue new-item)
             queue))
     (else
      (begin (set-cdr! (rear-ptr queue) new-item)
             (set-rear-ptr! queue new-item)
             queue)))))

(define (delete-queue! queue)
  (if (empty-queue? queue)
      (error "the queue is empty")
      (begin (set-fron-ptr! queue
               (cdr (fron-ptr queue)))
             queue)))

(define (print-queue queue)
  (fron-ptr queue))
