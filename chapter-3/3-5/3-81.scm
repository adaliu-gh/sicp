(load "stream.scm")

(define (random request-stream)
  (define random-numbers
    (cons-stream
     random-init
     (stream-map
      (lambda (number request)
        (if (eq? request 'generate)
            (rand-update number)
            request ;; the specified value
            ))
      random-numbers request-stream) ))
  random-numbers)
