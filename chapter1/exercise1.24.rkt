#lang planet neil/sicp

(define (timed-prime-test n count)
  (newline)
  (display n)
  (start-prime-test n count (runtime)))

(define (start-prime-test n count start-time)
  (if (fast-prime? n count)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display "***")
  (display elapsed-time))

(define (square n) (* n n))

(define (even? n)
  (= (remainder n 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (try-it (+ 1 (random (- n 1))) n))

(define (try-it a n) (= (expmod a n n) a))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))