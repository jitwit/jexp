example0 =: 0 : 0
(a b c)
)

example1 =: 0 : 0
(a "b\c(\"d" e)
(f g)
)

example2 =: 0 : 0
(a ; b () ; "a comment\"
 c
   d)
)

example3 =: 0 : 0
;;;; blah blah
(a b (c d (e
f)) g h)
)

example4 =: 0 : 0
(()())(())((()(()())))()
)

example5 =: 0 : 0
(ab"ab ab")
)

example6 =: 0 : 0
(12"12
")
)

NB. from wikipedia
example7 =: 0 : 0
(define (factorial x)
   (if (zero? x)
       1
       (* x (factorial (- x 1)))))
)

example8 =: 0 : 0
(((S) (NP VP))
 ((VP) (V))
 ((VP) (V NP))
 ((V) died)
 ((V) employed)
 ((NP) nurses)
 ((NP) patients)
 ((NP) Medicenter)
 ((NP) "Dr Chan"))
)

NB. fixme: parses with extra space at end
example9 =: 0 : 0
((42 T) ("A to Z" (1 2 3))) 
)

example10 =: 0 : 0
(a ((b) c)); i am mishandled?
(d e f)
)

example11 =: 0 : 0
 (ship (registry 1701)
       (x        42)
       (y        13))
)

example12 =: 0 : 0
 (users
   ((uid 1)   (name root) (gid 1))
   ((uid 108) (name matt) (gid 108))
   ((uid 109) (name ralf) (gid 109)))
)

example13 =: 0 : 0
((bool #t)
 (char #\x)
 (vec '#(a b c)))
)
