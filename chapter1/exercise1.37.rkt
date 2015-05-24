#lang planet neil/sicp

; 1.37a
(define (cont-frac-i n d k)
  (define (fraction x)
    (+ (d k) (/ (n k) x)))
  (define (cont-frac-iter x k)
    (let ((next (fraction x)))
      (if (> k 1)
          (cont-frac-iter next (- k 1))
          (/ (n k) next))))
  (cont-frac-iter (d k) k))

(define (cont-frac-a x)
  (cont-frac-i (lambda (i) 1.0)
               (lambda (i) 1.0)
               x))

; 1.37b
(define (cont-frac-r n d k m)
  (define (fraction x)
    (/ (n m) (+ (d m) x)))
  (if (> m k)
      (/ (n m) (d m))
      (fraction (cont-frac-r n d k (+ m 1)))))

(define (cont-frac-b x)
  (cont-frac-r (lambda (i) 1.0)
               (lambda (i) 1.0)
               x
               1))