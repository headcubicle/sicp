#lang planet neil/sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube n) (* n n n))
         
(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (simpson-term x) (+ (f x)
                              (* 4 (f (+ x h)))
                              (f (+ x h h))))
  (define (simpson-next x) (+ x h h))
  (/ (* h (sum simpson-term a simpson-next (- b h)))
     3.0))