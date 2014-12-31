#lang planet neil/sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (inc n) (+ n 1))

(define (pi-term x) (/ 1.0 (* x (+ x 2))))

(define (pi-next x) (+ x 4))

(define (pi-sum a b)
  (sum pi-term a pi-next b))