#lang planet neil/sicp

; 1.37a
(define (cont-frac-i n d k)
  (define (cont-frac-iter x i)
    (define (fraction x)
      (+ (d i) (/ (n i) x)))
    (let ((next (fraction x)))
      (if (> i 1)
          (cont-frac-iter next (- i 1))
          (/ (n i) next))))
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

; 1.38
(define (cont-frac n d k)
  (define (cf i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (cf (+ i 1))))))
  (cf 1))

(define (exercise1.38 x)
  (+ 2.0 (cont-frac-i (lambda (i) 1.0)
                      (lambda (i) (if (= (remainder i 3) 2) (* (/ (+ i 1) 3) 2)
                                      1))
                      x)))