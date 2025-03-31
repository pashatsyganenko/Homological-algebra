#import "definitions.typ": *

Тем самым мы определили категорию комплексов $Com(cal(A))$ некоторой абелевой категории $cal(A)$.

#theorem[
  Категория $cal(A)$ абелева $arrow.double$ $Com(cal(A))$ абелева.
]
#proof[
  - $Com(cal(A))$ -- аддитивная категория. Очевидно.
  - $Com(cal(A))$ -- предабелева категория. Фиксируем $f: X^circle.filled.small -> Y^circle.filled.small$.
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    let (A,B,C,D,E,X,Y,Z) = ((-1,0),(0,0),(1,0),(-2,0),(2,0),(-1,-1),(0,-1),(1,-1))
    let (Y1,Y2,Y3,Y4,Y5) = ((-2,1),(-1,1),(0,1),(1,1),(2,1))
    node(A,$X^(n)$)
    node(B,$X^(n+1)$)
    node(C,$X^(n+2)$)
    edge(A,B,$d_X^n$,"->")
    edge(B,C,$d_X^(n+1)$,"->")
    node(D,$dots.c$)
    node(E,$dots.c$)
    edge(D,A,"->")
    edge(C,E,"->")
    node(Y1,$dots.c$)
    node(Y2,$Y^n$)
    node(Y3,$Y^(n+1)$)
    node(Y4,$Y^(n+2)$)
    node(Y5,$dots.c$)
    edge(Y1,Y2,"->")
    edge(Y2,Y3,$d_Y^n$,"->")
    edge(Y3,Y4,$d_Y^(n+1)$,"->")
    edge(Y4,Y5,"->")
    edge(A,Y2,$f^n$,label-side: left,"->")
    edge(B,Y3,$f^(n+1)$,label-side: left,"->")
    edge(C,Y4,$f^(n+2)$,label-side: left,"->")
    node(X,$Ker(f^(n-1))$)
    node(Y,$Ker(f^(n))$)
    node(Z,$Ker(f^(n+1))$)
    edge(X,A,$ker f^(n-1)$,label-side: left,"->")
    edge(Y,B,$ker f^(n)$,label-side: left,"->")
    edge(Z,C,$ker f^(n+1)$,label-side: left,"->")
  }))
  #comment[НЕ ДОПИСАНО, СМ ФОТО].
  //- $Com(cal(A))$ -- абелева категория.
]

#definition[
  Когомологиями комплекса $X^circle.filled.small$ называются $H^n (X^circle.filled.small) := Ker(d^n) slash Im(d^(n-1))$.
]
Они определены так как из условия $d^(n+1) d^n = 0$ следует $Ker(d^n) supset.eq Im(d^(n-1))$. Теперь определим когомологии на морфизмах. Рассмотрим $f: X^circle.filled.small -> Y^circle.filled.small$. Фиксируем $overline(x) in H^n (X^circle.filled.small)$. $ H^n (f)(overline(x)) := f(x) + Im(d_Y^(n-1)) = overline(f(x)). $
- Корректность определения очевидна: $ x-y in Im(d^(n-1)_X) arrow.double exists z in X^(n-1) : d_X^(n-1) (z) = x-y arrow.double f(x-y) = f d_X^(n-1) (z) = d_Y^(n-1) f (z) in Im(d_Y^(n-1)). $
- $d_n^Y (f(x)) = f^(n+1)(overline(d_X^n (x))) = 0 arrow.double f(x) in Ker(f^n)$.
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
  #comment[Гомотопность]
]

#definition[
  Стягивающая гомотопия.
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

#theorem[
  Короткая точная последовательность комлпексов $K^circle.filled.small >-> L^circle.filled.small ->> M^circle.filled.small$ индуцирует точную последовательность когомологий
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    
  }))
]
