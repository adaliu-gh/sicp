(define song-freq
  '((a 2) (get 2) (sha 3) (wah 1) (boom 1) (job 2) (na 16) (yip 9)))
(define song
  '(get a job sha na na na na na na na na get a job sha na na na na na na na na wah yip yip yip yip yip yip yip yip yip sha boom))

(define song-tree (generate-huffman-tree song-freq))
(define bits (encode song song-tree))
;; (length song) ;; 36
;; (length bits) ;; 84
;; if using fixed-length coding, then we need 36*3 = 108 bits
