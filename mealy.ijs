load 'jexp.ijs json.ijs'
colors_a=: 'gray';'orange';'darkgreen';'blue';'darkgreen';'blue';'red'

export =: 3 : 0
  'sts chrs mach' =. y
  out =. 'digraph {',LF,'  overlap=scale;node[shape=circle];',LF
  for_uc. , { (<@i."0) 2 {. $ mach do.
    'u c' =. > uc [ 'v a' =. uc { mach
    out =. out,'  ',(>u{sts),'->',(>v{sts)
    out =. out,'[headlabel="',(>c{chrs),'",color=',(>a{colors_a)
    out =. out,',labeldistance=1.8,style=dashed];',LF
  end. out,'}',LF
)

dotsexp =: 3 : 0
labv =: 'libmo';'token';'string';'escape';'paren';'comment';'hash';'quote'
labc =: 'ws';'()';'\"';'\\';';';'nl';'#';'''';'abc'
(export (labv ,&< labc) , < sexpm) 1!:2 < 'sexp.dot'
2!:0 'dot -Tsvg sexp.dot -o sexp.svg; xdg-open sexp.svg'
)

dotjson =: 3 : 0
labv =: 7 {. 'space';'string';'escape';'sep';(<@":)"0 i. 7
labc =: 'ws';'\"';'\\';'sep';'abc'
(export (labv ,&< labc) , < words) 1!:2 < 'json.dot'
2!:0 'dot -Tsvg json.dot -o json.svg; xdg-open json.svg'
)