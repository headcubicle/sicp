#lang planet neil/sicp

(define (square n) (* n n))

(define (even? n)
  (= (remainder n 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test-iter a n)
  (if (< a n) (if (= (expmod a n n) a) (fermat-test-iter (+ a 1) n)
                  (display false))
      (display true)))

(define (fermat-test n)
  (fermat-test-iter 1 n))