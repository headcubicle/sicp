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
  (define (pi-factor n) (/ (* (- n 2.0) n) (square (- n 1.0))))
  (define (pi-next n) (- n 2.0))
  (* (product pi-factor n pi-next 3.0) 4.0))