#lang racket

; constants
(define NUM-ROUNDS 1)
(define RANDOM-WINS 0)
(define STRATEGY-WINS 0)
(define TIES 0)

; functions
(define (d-list n s)
  (for/list ([i n])
    (add1 (random s))))

(define (d-list+sum n s)
  (define l (d-list n s))
  (define sum (for/sum ([i l]) i))
  `(,l ,sum))

