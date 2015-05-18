#lang planet neil/sicp

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (cube n) (* n n n))
         
(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (simpson-term x) (+ (f x)
                              (* 4 (f (+ x h)))
                              (f (+ x h h))))
  (define (simpson-next x) (+ x h h))
  (/ (* h (sum simpson-term a simpson-next (- b h)))
     3.0))

(define (identity x) x)

(define (inc n) (+ n 1))

(define (sum-integers a b)
  (sum identity a inc b))