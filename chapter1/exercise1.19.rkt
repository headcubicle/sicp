#lang planet neil/sicp

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(define (even? n)
  (= (remainder n 2) 0))

;a <- bq + aq + ap
;b <- bp + aq

;a' <- (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;b' <- (bp + aq)p + (bq + aq + ap)q

;a' <- bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2
;b' <- bp^2 + apq + bq^2 + aq^2 + apq

;bq' + aq' + ap' <- 2bpq + 2aq^2 + bq^2 + 2apq + ap^2
;bq' + a(p' + q') <- b(2pq + q^2) + a(2q^2 + 2pq + p^2)

;bp' + aq' <- bp^2 + 2apq + bq^2 + aq^2
;bp' + aq' <- b(p^2 + q^2) + a(2pq + q^2)

;bq' + aq' + ap' <- (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;bp' + aq' <- (bp + aq)p + (bq + aq + ap)q

;ap' <- (bq + aq + ap)p
;ap' <- bpq + apq + ap^2
;p' <- bpq/a + pq + p^2

;aq' <- (bq + aq + ap)q
;aq' <- bq^2 + aq^2 + apq
;q' <- bq^2/a + q^2 + pq