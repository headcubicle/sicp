#lang planet neil/sicp

(define (pascals-triangle row col)
  (cond ((or (< row 1) (> col row)) 0)
        ((or (= col 1) (= row col)) 1)
        (else (+ (pascals-triangle (- row 1) col)
                 (pascals-triangle (- row 1) (- col 1))))))