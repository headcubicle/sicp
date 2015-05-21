#lang planet neil/sicp

(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (if (filter a) (iter (next a) (combiner result (term a)))
            (iter (next a) result))))
  (iter a null-value))

(define (identity x) x)

(define (inc n) (+ n 1))

; 1.33a
(define (square n) (* n n))

(define (even? n)
  (= (remainder n 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((and (not (or (= base 1) (= base (- m 1)))) (= (remainder (square base) m) 1)) 0)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin-test n)
  (try-it (+ 1 (random (- n 1))) n))

(define (try-it a n) (= (expmod a (- n 1) n) 1))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (fast-prime? n 1000))

(define (sum-square-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

; 1.33b
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (1.33b a b)
  (define (1.33b-gcd n)
    (if (= (gcd b n) 1) true
        false))
  (filtered-accumulate 1.33b-gcd * 1 identity a inc b))