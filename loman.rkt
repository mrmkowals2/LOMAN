#lang racket


(require (file "dice-sum-partition-sets.rkt"))


; ## constants ##

(define NUM-ROUNDS 1)
(define RANDOM-WINS 0)
(define STRATEGY-WINS 0)
(define TIES 0)


; ## structures ##
(struct board
  (one
   two
   three
   four
   five
   six
   seven
   eight
   nine))


; ## functions ##

; Integer Integer -> List
; takes a number of dice to be rolled (n) and the number of sides on
;   each die (s) - returns a list of size n containing the side number
;   for each die
; given: 2 6, expect: ([1-6] [1-6])
; given: 4 5, expect: ([1-5] [1-5] [1-5] [1-5])
(define/contract (d-list n s)
  (integer? integer? . -> . list?)
  (for/list ([i n])
    (add1 (random s))))

; List -> Integer
; takes a list of integers and sums the items in the list
; given: '(1 4), expect: 5
; given: '(2 5 1), expect: 8
(define (sum l)
  (if (empty? l)
      0
      (+ (first l) (sum (rest l)))))

