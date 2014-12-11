#lang planet neil/sicp

(define (sqrt x)
  (sqrt-iter 1.0 (improve 1.0 x) x))

(define (sqrt-iter prev guess x)
       (if (good-enough? prev guess)
           guess
           (sqrt-iter guess (improve guess x)
                      x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? prev guess)
  (< (abs (/ (- prev guess) guess)) 0.001))

(define (square x)
  (* x x))