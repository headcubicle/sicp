#lang planet neil/sicp

(define (cubic-root x)
  (cubic-root-iter 1.0 (improve 1.0 x) x))

(define (cubic-root-iter prev guess x)
       (if (good-enough? prev guess)
           guess
           (cubic-root-iter guess (improve guess x)
                      x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? prev guess)
  (< (abs (/ (- prev guess) guess)) 0.001))

(define (square x)
  (* x x))