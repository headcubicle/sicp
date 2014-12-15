#lang planet neil/sicp

(define (ex1-11recr n)
  (if (< n 3) n
      (+ (ex1-11recr (- n 1))
         (* 2 (ex1-11recr (- n 2)))
         (* 3 (ex1-11recr (- n 3))))))

(define (ex1-11 n)
  (ex1-11iter 2 1 0 n))

(define (ex1-11iter a b c n)
  (cond ((< n 1) n)
        ((= n 1) b)
        ((= n 2) a)
        (else (ex1-11iter (+ a (* 2 b) (* 3 c)) a b (- n 1)))))
