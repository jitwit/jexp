colors_a=: 'gray';'orange';'darkgreen';'blue';'darkgreen';'blue';'red'

ixes =: [: { [: <@i."0 (2 {. $)

NB. x is state labels, y is char class labels
export =: 4 : 0
  'sts chrs' =. x
  out =. 'digraph {',LF,'overlap=scale;node[shape=circle];',LF
  for_uv. , ixes y do.
    'u c' =. > uv
    'v a' =. uv { y
    lab =. '[label="',(c{::chrs),'",color=',(a{::colors_a),'];'
    out =. out,'  ',(u{::sts),' -> ',(v{::sts),lab,LF
  end. out,'}',LF
)

drawit =: 3 : 0
labv =: 'libmo';'token';'quote';'escape';'paren';'comment'
labc =: 'WS';'()';'\"';'\\';';';'LF';'letter'
((labv ,&< labc) export sexpm) 1!:2 < 'sexp.dot'
2!:0 'dot -Kneato -Tpng sexp.dot -o sexp.png; xdg-open sexp.png'
)