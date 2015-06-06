#lang planet neil/sicp

(define (inc x) (+ x 1))

(define (square x) (* x x))

(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
  (lambda (x)
    (if (> n 0) 
         ((repeated f (- n 1)) (f x))
         x)))

(define dx 0.00001)

(define (smooth f) 
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (n-fs-function f n)
    ((repeated smooth n) f))

; 1.45
(define k 1)

(define tolerance 0.0001)

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (n-th-root n x)
  (let ((k (floor (/ (log n) (log 2)))))
    (fixed-point ((repeated average-damp k)
                  (lambda (y) (/ x (expt y (- n 1))))) 1.0)))