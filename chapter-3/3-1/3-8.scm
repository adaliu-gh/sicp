(define f
  (let ((x 0))
    (lambda (arg)
      (begin
        (define result x)
        (set! x arg)
        result))))
