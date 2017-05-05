(load "stream.scm")

(define (RLC R L C dt)
  (lambda (vc0 il0)
    (define vc (integral (delay -il/c) vc0 dt))
    (define il (integral (delay vc/l-ril/l) il0 dt))
    (define -il/c (stream-map - (div-streams il C)))
    (define vc/l-ril/l (sub-streams
                        (div-streams vc L)
                        (div-streams (mul-streams R il) L)))
    (cons vc il)))
