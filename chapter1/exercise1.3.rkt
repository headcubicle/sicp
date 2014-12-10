#lang planet neil/sicp
(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (exercise1.3 x y z)
  (cond ((and (>= x z) (>= y z)) (sum-of-squares x y))
        ((and (>= y x) (>= z x)) (sum-of-squares y z))
        ((and (>= z y) (>= x y)) (sum-of-squares x z))))