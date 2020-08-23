NB. parsing s-expressions
NB. 1. tokenize with ;: respecting quoting and escaping
NB. 2. produce depth vector from paren tokens
NB. 3. select tokens that aren't parens and combine with depths

NB. missing stuff includes comments, doing forests sensibly, and dots

NB. sexpression machine, find tokens respecting quotation
NB. char class: 0     1  2 3 4      5       6
NB.             space () " \ letter comment newline
sexpc =: (1 I.~ (' ';'()';'"';'\';';';LF) e.&>~ ])"0 a.
NB. states: 0       1   2    3   4    5    
NB.         neutral tok quot esc brak comment
sexpm =: 6 7 2 $ , ". ;. _2 ] 0 : 0
0 1  4 1  2 1  0 6  1 1  5 1  0 1 NB. neutral
0 3  4 2  0 6  0 6  1 0  5 2  0 3 NB. tok
2 0  2 0  0 3  3 0  2 0  2 0  2 0 NB. quot/"
2 0  2 0  2 0  2 0  2 0  2 0  2 0 NB. esc/\
0 3  4 2  2 2  0 6  1 2  5 2  0 3 NB. bark/()
5 0  5 0  5 0  5 0  5 0  5 0  0 3 NB. comment/;
)

NB. expand to include roots...
tokens =: (0;sexpm;sexpc)&;:
parens =: (<,'(')&= - (<,')')&=

tree =: 3 : 0
deps =. +/\ pars =. parens y
(0,ixes#deps) (;&<) 'ROOT'; y #~ ixes=. 0 = pars
)

parse =: 3 : 0
trees =. (0 = +/\ parens toks) tree;.2 toks=. tokens y
(;^:2 {."1 trees) ; ; {:"1 trees
)

exampler =: '((c d e)(a (f g)) abba baba (ab)) (a (b c) d)'
exampleq =: '(1123 2 ("ca(t\"" 55))'
