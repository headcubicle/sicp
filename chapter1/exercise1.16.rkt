#lang planet neil/sicp

(define (ex1-16 b n)
  (ex1-16-iter 1 b n))

(define (ex1-16-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (ex1-16-iter a (square b) (/ n 2)))
        (else (ex1-16-iter (* a b) b (- n 1)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n) (* n n))