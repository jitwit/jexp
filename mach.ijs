load 'jexp.ijs'
colors_a=: 'gray';'orange';'darkgreen';'blue';'darkgreen';'blue';'red'

export =: 3 : 0
  'sts chrs mach' =. y
  out =. 'digraph {',LF,'  overlap=scale;node[shape=circle];',LF
  for_uv. , { (<@i."0) 2 {. $ mach do.
    'u c' =. > uv [ 'v a' =. uv { mach
    out =. out,'  '
    out =. out,(>u{sts),'->',(>v{sts)
    out =. out,'[headlabel="',(>c{chrs),'",color=',(>a{colors_a)
    out =. out,',labeldistance=1.8,style=dashed'
    out =. out,'];',LF
  end. out,'}',LF
)

drawit =: 3 : 0
labv =: 'libmo';'token';'string';'escape';'paren';'comment';'hash';'quote'
labc =: 'WS';'()';'\"';'\\';';';'LF';'#';'''';'letter'
(export (labv ,&< labc) , < sexpm) 1!:2 < 'sexp.dot'
2!:0 'dot -Tsvg sexp.dot -o sexp.svg; xdg-open sexp.svg'
)