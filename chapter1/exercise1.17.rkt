#lang planet neil/sicp

(define (* a b)
  (*-iter 0 a b))

(define (*-iter x a b)
  (cond ((= b 0) x)
        ((even? b) (*-iter x (double a) (halve b)))
        (else (*-iter (+ x a) a (- b 1)))))

(define (double n)
  (+ n n))

(define (halve n)
  (if (even? n) (/ n 2)
      n))

(define (even? n)
  (= (remainder n 2) 0))