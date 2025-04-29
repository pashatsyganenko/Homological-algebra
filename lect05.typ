#import "definitions.typ": *

Тем самым мы определили категорию комплексов $Com(cal(A))$ некоторой абелевой категории $cal(A)$.

#theorem[
  Категория $cal(A)$ абелева $arrow.double$ $Com(cal(A))$ абелева.
]
#proof[
  - $Com(cal(A))$ -- аддитивная категория. Очевидно.
  - $Com(cal(A))$ -- предабелева категория. Фиксируем $f: X^circle.filled.small -> Y^circle.filled.small$. Докажем существование ядра, для коядра рассуждения аналогичны. У каждого морфизма $f^n$ существует своё ядро.
  #align(center, diagram(cell-size: 7mm, label-size: 2.5mm, {
    let cor = blue
    let (A,B,C,D,E,Z1,Z2,Z3,Z4,Z5) = ((-1,0),(0,0),(1,0),(-2,0),(2,0),(-2,-2),(-1,-2),(0,-2),(1,-2),(2,-2))
    let (Y1,Y2,Y3,Y4,Y5) = ((-2,1),(-1,1),(0,1),(1,1),(2,1))
    let(X1,X2,X3,X4,X5) = ((-2.65,-1),(-1.65,-1),(-0.65,-1),(0.35,-1),(1.35,-1))
    node(A,$X^(n-1)$)
    node(B,$X^n$)
    node(C,$X^(n+1)$)
    edge(A,B,$d_X^(n-1)$,"->")
    edge(B,C,$d_X^n$,"->")
    node(D,$dots.c$)
    node(E,$dots.c$)
    edge(D,A,"->")
    edge(C,E,"->")
    node(Y1,$dots.c$)
    node(Y2,$Y^(n-1)$)
    node(Y3,$Y^n$)
    node(Y4,$Y^(n+1)$)
    node(Y5,$dots.c$)
    edge(Y1,Y2,"->")
    edge(Y2,Y3,$d_Y^(n-1)$,"->")
    edge(Y3,Y4,$d_Y^n$,"->")
    edge(Y4,Y5,"->")
    edge(A,Y2,$f^(n-1)$,label-side: left,"->")
    edge(B,Y3,$f^n$,label-side: left,"->")
    edge(C,Y4,$f^(n+1)$,label-side: left,"->")
    node(Z2,$Ker(f^(n-1))$)
    node(Z3,$Ker(f^(n))$)
    node(Z4,$Ker(f^(n+1))$)
    edge(Z2,A,$ker f^(n-1)$,label-side: left,"->",label-pos: 20%)
    edge(Z3,B,$ker f^(n)$,label-side: left,"->",label-pos: 20%)
    edge(Z4,C,$ker f^(n+1)$,label-side: left,"->",label-pos: 20%)
    node(Z1, text(fill: cor, $dots.c$))
    node(Z5, text(fill: cor, $dots.c$))
    edge(Z1,Z2,stroke: cor, "->")
    edge(Z2,Z3,stroke:cor, text(fill: cor, $hat(d)^(n-1)$), "->")
    edge(Z3,Z4,stroke:cor, text(fill: cor, $hat(d)^n$), "->")
    edge(Z4,Z5,stroke: cor, "->")
    let cor2 = orange
    node(X1,text(fill:cor2,$dots.c$))
    node(X2,text(fill:cor2,$D^(n-1)$))
    node(X3,text(fill:cor2,$D^n$))
    node(X4,text(fill:cor2,$D^(n+1)$))
    node(X5,text(fill:cor2,$dots.c$))
    edge(X1,X2,stroke: cor2, "->")
    edge(X2,X3,stroke:cor2, text(fill: cor2, $d_D^(n-1)$), "->",label-pos: 20%,crossing:true)
    edge(X3,X4,stroke:cor2, text(fill: cor2, $d_D^n$), "->",label-pos: 20%,crossing:true)
    edge(X4,X5,stroke: cor2, "->")
    edge(X2,A,stroke:cor2, text(fill:cor2,$phi^(n-1)$),"->")
    edge(X3,B,stroke:cor2, text(fill:cor2,$phi^n$),"->")
    edge(X4,C,stroke:cor2, text(fill:cor2,$phi^(n+1)$),"->")
    edge(X2,Z2,stroke:cor2, text(fill:cor2,$psi^(n-1)$),"->")
    edge(X3,Z3,stroke:cor2, text(fill:cor2,$psi^n$),"->")
    edge(X4,Z4,stroke:cor2, text(fill:cor2,$psi^(n+1)$),"->")

  }))
  Так как $f^n d_X^(n-1) ker f^(n-1) = d_Y^(n-1) underbracket(f^(n-1) ker f^(n-1), =0) = 0$, то по определению ядра существует единственный $hat(d)^(n-1) : Ker(f^(n-1)) -> Ker(f^n)$ такой, что $ ker f^n hat(d)^(n-1) = d_X^(n-1) ker f^(n-1)$.
  $ ker f^(n+1) hat(d)^n hat(d)^(n-1) =  underbracket(d_X^n ker f^n, =0) hat(d)^(n-1) = 0, $
  откуда следует, что $hat(d)^n hat(d)^(n-1)$, так как все ядра мономорфизмы и на них можно сокращать слева. Тем самым, $(Ker f^circle.filled.small, hat(d)^circle.filled.small)$ -- комплекс и $ker f^circle.filled.small$ -- морфизм в комплекс $X^circle.filled.small$. Покажем, что это и есть ядро $f^circle.filled.small$. Фиксируем комплекс $D^circle.filled.small$ и морфизм $phi^circle.filled.small$ такой, что $f^circle.filled.small phi^circle.filled.small = 0$. Тогда $forall n in ZZ : exists ! psi^n: D_n -> Ker(f^n)$ т. ч. $ker f^n psi^n = phi^n$. Понятно, что $psi^circle.filled.small$ -- морфизм комплексов, он нам подходит и подходит только он.
  - $Com(cal(A))$ -- абелева категория. #comment[ДОПИСАТЬ]
]

#definition[
  Когомологиями комплекса $X^circle.filled.small$ называются $H^n (X^circle.filled.small) := Ker(d^n) slash Im(d^(n-1))$.
]
Они определены так как из условия $d^(n+1) d^n = 0$ следует $Ker(d^n) supset.eq Im(d^(n-1))$. Теперь определим когомологии на морфизмах. Рассмотрим $f: X^circle.filled.small -> Y^circle.filled.small$. Фиксируем $overline(x) in H^n (X^circle.filled.small)$. $ H^n (f)(overline(x)) := f(x) + Im(d_Y^(n-1)) = overline(f(x)). $
- Корректность определения очевидна: $ x-y in Im(d^(n-1)_X) arrow.double exists z in X^(n-1) : d_X^(n-1) (z) = x-y arrow.double f(x-y) = f d_X^(n-1) (z) = d_Y^(n-1) f (z) in Im(d_Y^(n-1)). $
- $d_n^Y (f(x)) = f^(n+1)(overline(d_X^n (x))) = 0 arrow.double f(x) in Ker(f^n)$. #comment[К чему эта строчка?]
- $H^n (1)=1$.

#note[
  + $H^n (f+g) = H^n (f) + H^n (g)$.
  + $H^n (f g) = H^n (f) H^n (g)$.
]
Тем самым $H$ -- аддитивный ковариантный функтор $Com(cal(A)) arrow.long Com(cal(A))$.

#definition[
  Комплес $X^circle.filled.small$ называется ацикличным, если $H^n (X) = 0 quad forall n in NN$.
]

== Гомотопия

#definition[
  Морфизмы $f,g: X^circle.filled.small -> Y^circle.filled.small$ называются гомотопными, если существует семейство отображений $s_n : X^n -> Y^(n-1)$ такое, что $s^(n+1) d_X^n + d_Y^(n-1) s^n = f^n - g^n quad forall n in ZZ$. Обозначается как $f ~ g$.
  #align(center, diagram(cell-size: 15mm, label-size: 3mm, {
  let (X1,X2,X3,X4,X5) = ((0,0),(1,0),(2,0),(3,0),(4,0))
  let (Y1,Y2,Y3,Y4,Y5) = ((0,1),(1,1),(2,1),(3,1),(4,1))
  node(X1,$dots.c$)
  node(X5,$dots.c$)
  node(Y1,$dots.c$)
  node(Y5,$dots.c$)
  node(X2,$X^(n-1)$)
  node(X3,$X^n$)
  node(X4,$X^(n+1)$)
  node(Y2,$Y^(n-1)$)
  node(Y3,$Y^n$)
  node(Y4,$Y^(n+1)$)
  edge(X1,X2,"->")
  edge(X2,X3,$d_X^(n-1)$,"->")
  edge(X3,X4,$d_X^n$,"->")
  edge(X4,X5,"->")
  edge(Y1,Y2,"->")
  edge(Y2,Y3,$d_Y^(n-1)$,"->",label-side:right)
  edge(Y3,Y4,$d_Y^n$,"->",label-side:right)
  edge(Y4,Y5,"->")
  edge(X2,Y2,$f^(n-1)$,"->",bend:-15deg)
  edge(X2,Y2,$g^(n-1)$,"->",bend:15deg)
  edge(X3,Y3,$f^n$,"->",bend:-15deg)
  edge(X3,Y3,$g^n$,"->",bend:15deg)
  edge(X4,Y4,$f^(n+1)$,"->",bend:-15deg)
  edge(X4,Y4,$g^(n+1)$,"->",bend:15deg)
  edge(X2,Y1,"-->")
  edge(X3,Y2,"-->",$s^n$,label-pos:30%)
  edge(X4,Y3,"-->",$s^(n+1)$,label-pos:30%)
  edge(X5,Y4,"-->")  
  }))
]

#definition[
  Стягивающей гомотопией называется гомотопия между морфизмом и нулём.
]

#definition[
  Комплекс $X^circle.filled.small$ гомотопен нулю, если $id_(X^circle.filled.small) tilde 0$.
]

#lemma[
  $f ~ g arrow.double H^n (f) = H^n (g)$.
]
#proof[
  Не умаляя общности, $g = 0$. Фиксируем $overline(x) in H^x (X)$. $ H^n (f) (overline(x)) = overline(f(x)) = overline((d h + h d)(x)) = underparen(overline(d h (x)), in Im(d^(n-1))) + overline(h d (x)) = overline(0). $
]

#corollary[
  $X^circle.filled.small$ ацикличен #iff $X^circle.filled.small ~ 0$.
]
#proof[
  #comment[???]
]

#definition[
  Морфизм $f: X^circle.filled.small -> Y^circle.filled.small$ называется гомотопической эквивалентностью, если $ exists g: Y^circle.filled.small -> X^circle.filled.small: quad g f ~ id_X " и " f g ~ id_Y. $
]

#corollary[
  Если $f$ -- гомотопическая эквивалентность, то $H^n (f)$ -- изоморфизм.
]
#proof[
  $g f = id_X arrow.double H^n (g f) = H^n (id_X) = id_X$ #comment[БЛАБЛАБЛА]
]

#definition[
  #comment[ТП И КТП]
]

#theorem("Лемма о змее")[
  Для диаграммы ниже с точными строками
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, 
  $
    & A_1 edge("d", "->", f) edge("->") & B_1 edge("d", "->", g) edge("->") & C_1 edge("d", "->", h) edge("->") & 0 \
    0 edge("->") & A_2 edge("->") & B_2 edge("->") & C_2                                                      
  $))

  имеет место следующая точная последовательность, связывающая ядра и коядра:

  #align(center, diagram(cell-size: 7mm, label-size: 3.5mm, 
  $
    & ker(f) edge("d", "->") edge("->") & ker(g) edge("d", "->") edge("->") & ker(h) edge("d", "->") \
    & A_1 edge("d", "->", f) edge("->") & B_1 edge("d", "->", g) edge("->") & C_1 edge("d", "->", h) edge("->") & 0 \
    0 edge("->") & A_2 edge("d", "->") edge("->") & B_2 edge("d", "->") edge("->") & C_2 edge("d", "->") \ 
    & coker(f) edge("->") & coker(g) edge("->") & coker(h)                                               
  $,
  edge((3,0), (5, 0), (5,1.65), (-1,1.65), (-1, 3), (1, 3), "-->", $exists delta$, corner-radius: 10mm, label-pos: 47.5%, "crossing", crossing-thickness: 12, dash: 2))),
] <snake-lemma>

#proof[
  Фольклор.
]

#note[
  Если перед $A_1$ или после $C_2$ добавить ноль, то он также появится перед $ker(f)$ или после $coker(h)$ соответственно.
]

#theorem("Длинная когомологическая последовательность")[
#theorem("Лемма о змее")[
  Для диаграммы ниже с точными строками
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, 
  $
    & A_1 edge("d", "->", f) edge("->") & B_1 edge("d", "->", g) edge("->") & C_1 edge("d", "->", h) edge("->") & 0 \
    0 edge("->") & A_2 edge("->") & B_2 edge("->") & C_2                                                      
  $))

  имеет место следующая точная последовательность, связывающая ядра и коядра:

  #align(center, diagram(cell-size: 7mm, label-size: 3.5mm, 
  $
    & ker(f) edge("d", "->") edge("->") & ker(g) edge("d", "->") edge("->") & ker(h) edge("d", "->") \
    & A_1 edge("d", "->", f) edge("->") & B_1 edge("d", "->", g) edge("->") & C_1 edge("d", "->", h) edge("->") & 0 \
    0 edge("->") & A_2 edge("d", "->") edge("->") & B_2 edge("d", "->") edge("->") & C_2 edge("d", "->") \ 
    & coker(f) edge("->") & coker(g) edge("->") & coker(h)                                               
  $,
  edge((3,0), (5, 0), (5,1.65), (-1,1.65), (-1, 3), (1, 3), "-->", $exists delta$, corner-radius: 10mm, label-pos: 47.5%, "crossing", crossing-thickness: 12, dash: 2))),
] <snake-lemma>

#proof[
  Фольклор.
]

#theorem("Длинная когомологическая последовательность")[
  Короткая точная последовательность комлпексов $K^circle.filled.small >-> L^circle.filled.small ->> M^circle.filled.small$ индуцирует точную последовательность когомологий
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    
  }))
] <long-exact-seq-th>
