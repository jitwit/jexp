NB. parsing s-expressions
NB. 1. tokenize with ;: respecting quoting and escaping
NB. 2. produce depth vector from paren tokens
NB. 3. select tokens that aren't parens and combine with depths
NB.      sexpressions are parsed by dropping closing parens
NB.      and decreasing the depth of opening parens by 1. this gives a
NB.      depth vector that lines up with Hsu thesis ones.

require 'stats/bonsai'
load 'expressions.ijs'

NB. will modify escape to be ok for chars after #
NB. sexpression machine, find tokens respecting quotation
NB. char class: 0     1  2 3 4       5       6
NB.             space () " \ comment newline letter
sexpc =: (1 I.~ (' ';'()';'"';'\';';';LF) e.&>~ ])"0 a.
NB. states: 0       1   2    3   4    5    
NB.         neutral tok quot esc brak comment
sexpm =: 6 7 2 $ , (". ;. _2)  0 : 0
0 1  4 1  2 1  0 6  5 1  0 1  1 1 NB. neutral
0 3  4 2  2 2  1 0  5 2  0 3  1 0 NB. tok
2 0  2 0  0 3  3 0  2 0  2 0  2 0 NB. quot/"
2 0  2 0  2 0  2 0  2 0  2 0  2 0 NB. esc/\
0 3  4 2  2 2  0 6  5 2  0 3  1 2 NB. bark/()
5 0  5 0  5 0  5 0  5 0  0 3  5 0 NB. comment
)

tokens =: (0;sexpm;sexpc)&;:
parse =: 3 : 0
mask=. 0 <: pars=. -/ (;:'()') =/ toks=. (0;sexpm;sexpc) ;: y
toks ,~&<&(mask&#) (+/\ - 1&=) pars
)

comment =: ';'-:{.
nocomment =: 3 : 0
'd t' =. y
b =. -.@comment &> t
d ,&<&(b&#) t
)