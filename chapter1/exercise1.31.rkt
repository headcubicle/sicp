#lang planet neil/sicp

; 1.31a
(define (product term a next b)
  (define (iter a result)
    (if (< a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (cube n) (* n n n))
         
(define (identity x) x)

(define (inc n) (+ n 1))

(define (dec n) (- n 1))

(define (factorial n)
  (product identity n dec 1))

; 1.31b
;(define (product term a next b)
;  (if (< a b)
;      1
;      (* (term a)
;         (product term (next a) next b))))

(define (square x) (* x x))

(define (wallis-product n)
  (define (dec2 x) (- x 2))
  (/ (* (product identity n dec2 2)
        (product identity (dec2 n) dec2 4))
     (square (product identity (dec n) dec2 3))))