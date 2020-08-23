NB. parsing s-expressions
NB. idea might be to take several passes
NB. find quoted regions
NB. the second to find parens
NB. find tokens
NB. use paren information to produce depth vector of tokens

NB. sexpression machine, find tokens respecting quotation
NB. char class: 0     1  2 3 4
NB.             space () " \ letter
sexpc =: (1 I.~ (' ';'()';'"';'\') e.&>~ ])"0 a.
NB. states: 0       1   3    4   5
NB.         neutral tok quot esc brak
sexpm =: 5 5 2 $ , ". ;. _2 ] 0 : 0
0 1  4 1  2 1  0 6  1 1 NB. neutral
0 3  4 2  0 6  0 6  1 0 NB. tok
2 0  2 0  0 3  3 0  2 0 NB. quot/"
2 0  2 0  2 0  2 0  2 0 NB. esc/\
0 3  4 2  2 2  0 6  1 2 NB. bark/()
)

example =: '(1123 2 ("ca(t\"" 55))'

tokens =: (0;sexpm;sexpc)&;:
parens =: (<,'(')&= - (<,')')&=
depths =: +/\ @: parens

NB. (,. <"0 @ depths) @: tokens
parse =: 3 : 0
deps =. +/\ pars =. parens toks =. tokens y
(ixes # deps) ; toks #~ ixes=.0=pars
)