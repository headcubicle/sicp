#lang planet neil/sicp

; 1.37a
(define (cont-frac-i n d k)
  (define (cont-frac-iter x i)
    (define (fraction x)
      (/ (n i) (+ (d i) x)))
    (let ((next (fraction x)))
      (if (> i 1)
          (cont-frac-iter next (- i 1))
          next)))
  (cont-frac-iter (d k) k))

(define (cont-frac-a x)
  (cont-frac-i (lambda (i) 1.0)
               (lambda (i) 1.0)
               x))

; 1.37b
(define (cont-frac-r n d k)
  (define (cfr i)
    (define (fraction x)
      (/ (n i) (+ (d i) x)))
    (if (> i k)
        (/ (n i) (d i))
        (fraction (cfr (+ i 1)))))
  (cfr 1))

(define (cont-frac-b x)
  (cont-frac-r (lambda (i) 1.0)
               (lambda (i) 1.0)
               x
               1))