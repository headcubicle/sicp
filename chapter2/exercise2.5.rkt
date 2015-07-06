#lang planet neil/sicp

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z) (count z 2 0))
(define (cdr z) (count z 3 0))

(define (count a b n)
  (if (> (remainder a b) 0)
      n
      (count (/ a b) b (+ n 1))))