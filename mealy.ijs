load 'jexp.ijs json.ijs'
CLR=: 'gray';'orange';'darkgreen';'blue';'darkgreen';'blue';'red'

dotviz =: 3 : 0
'S C M N'=. y
G=. 'digraph {',LF,'  overlap=scale;node[shape=circle];',LF
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
labv =: 'libmo';'token';'string';'escape';'paren';'comment';'hash';'quote'
labc =: 'ws';'()';'\"';'\\';';';'nl';'#';'''';'abc'
dotviz (labv ,&< labc) , M;'sexp'
2!:0 'xdg-open sexp.svg'
)

dotjson =: 3 : 0
labv =: 7 {. 'space';'string';'escape';'sep';(<@":)"0 i. 7
labc =: 'ws';'\"';'\\';'sep';'abc'
dotviz (labv ,&< labc) , JM;'json'
2!:0 'xdg-open json.svg'
)