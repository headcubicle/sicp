#lang planet neil/sicp

(define (inc x) (+ x 1))

(define (square x) (* x x))

(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
  (lambda (x)
    (if (> n 0) 
         ((repeated f (- n 1)) (f x))
         x)))