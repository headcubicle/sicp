#lang planet neil/sicp

(define (square x) (* x x))

(define tolerance 0.0001)

(define (average x y)
  (/ (+ x y) 2))

; 1.46
(define (iterative-improve test improve)
  (lambda (g)
    (define (iter g)
      (if (test g) g
          (iter (improve g))))
    (iter g)))

(define (sqrt x)
  (define (good-enough? g)
    (< (abs (- (square g) x)) tolerance))
  (define (improve g)
    (average g (/ x g)))
  ((iterative-improve good-enough? improve) 1.0))

(define (fixed-point f)
  (define (close-enough? g)
    (< (abs (- g (f g))) tolerance))
  ((iterative-improve close-enough? f) 1.0))