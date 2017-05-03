(load "3-61.scm")
(define (div-series s1 s2)
  (if (= 0 (stream-car s2))
      (error "xxx")
      (mul-series s1 (invert-unit-series s2))))

(define tangent-series
  (div-series sine-series cosine-series))
