#lang planet neil/sicp

(define (average a b) (/ (+ a b) 2))

;線分
(define (make-segment ax ay bx by)
  (cons (start-segment ax ay) (end-segment bx by)))
(define (start p) (car p))
(define (end p) (cdr p))

;始点
(define (start-segment x y) (make-point x y))

;終点
(define (end-segment x y) (make-point x y))

;点
(define (make-point x y) (cons x y))
(define (x-point n) (car n))
(define (y-point n) (cdr n))

;点出力
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;線分出力
(define (print-segment s)
  (newline)
  (display "(")
  (display (x-point (start s)))
  (display ",")
  (display (y-point (start s)))
  (display ") (")
  (display (x-point (end s)))
  (display ",")
  (display (y-point (end s)))
  (display ")"))

;中間点
(define (midpoint-segment s)
  (make-point
   (average (x-point (start s)) (x-point (end s)))
   (average (y-point (start s)) (y-point (end s)))))

;長方形
(define (rectangle a b c d)
  (cons (cons a b) (cons c d)))
(define (segment-a r) (car (car r)))
(define (segment-b r) (cdr (car r)))
(define (segment-c r) (car (cdr r)))
(define (segment-d r) (cdr (cdr r)))

;周囲の長さ
(define (perimeter r)
  (+ (abs (- (x-point (start (segment-a r))) (x-point (end (segment-a r)))))
     (abs (- (y-point (start (segment-b r))) (y-point (end (segment-b r)))))
     (abs (- (x-point (start (segment-c r))) (x-point (end (segment-c r)))))
     (abs (- (y-point (start (segment-d r))) (y-point (end (segment-d r)))))))

;面積
(define (area r)
  (* (abs (- (x-point (start (segment-a r))) (x-point (end (segment-a r)))))
     (abs (- (y-point (start (segment-b r))) (y-point (end (segment-b r)))))))