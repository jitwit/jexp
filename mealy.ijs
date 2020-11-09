load 'expressions.ijs jexp.ijs json.ijs J.ijs'
CLR=: 'dimgray';'darkorange';'seagreen';'royalblue';'darkgreen';'blue';'maroon'
NB. exporting to dot files
dotviz =: 3 : 0
'S C M N'=. y
G=. 'digraph {',LF,'  overlap=scale;',LF
for_uc. , { (<@i."0) 2 {. $ M do.
  'u c' =. > uc [ 'v a' =. uc { M
  G=. G,'  ',(>u{S),'->',(>v{S)
  G=. G,'[headlabel="',(>c{C),'",color=',(>a{CLR)
  G=. G,',labeldistance=1.8,style=dashed];',LF
end. G=. G,'}',LF
G 1!:2 < N,'.dot'
2!:0 'dot -Tsvg ',N,'.dot -o ',N,'.svg'
)

dotsexp =: 3 : 0
labv =: ;:'limbo token string escape paren comment hash quote'
labc =: 'ws';'()';'\"';'\\';';';'nl';'#';'''';'abc'
dotviz (labv ,&< labc) , SM;'sexp'
2!:0 'xdg-open sexp.svg'
)

dotj =: 3 : 0
labc =: ;: 'S    A    9    D    C    Q    X'
labc =: 'ws';'abc';'012';'.';':';'\''';'+/-'
labv =: ;: 'space jascii alpha numeric quote unquote'
dotviz (labv ,&< labc) , sjx ; 'J'
2!:0 'xdg-open J.svg'
)

dotjson =: 3 : 0
labv =: 'space';'string';'escape';'sep';'token';'unquote';'escape'
labc =: 'ws';'\"';'\\';'sep';'abc'
dotviz (labv ,&< labc) , JM;'json'
2!:0 'xdg-open json.svg'
)

NB. depth => parent (Hsu)
P =: 3 : 0
ps=. 0 #~ n =. # y
for_lk. 2 ]\ (i.n) </.~ y
do. ps=. ps k }~ l {~ <: l I. k [ 'l k' =. lk
end. ps + (i. n) * 0 = y
)
