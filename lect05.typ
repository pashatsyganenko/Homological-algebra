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
#proof[
  #comment[Тут будет доказательство через лемму о змее, а не напрямую]
]

== Диаграммные фокусы

#theorem("3x3 лемма")[
  Если в диаграмме ниже все строки КТП и крайние столбцы *точные*, то и центральный тоже.
  #align(
    center, 
    diagram(
      cell-size: 7mm, {
        let nodes = ($A$, $B$, $C$)
        let arrows = ($alpha$, $beta$, $gamma$)
        for i in (1, 2, 3) {
          for (j, n) in nodes.enumerate() {
            node((j, i), $#n _#i$) 
            let type = if j == 0 {"hook->"} else {"->>"}
            if j < 2 {
              edge((j, i), "r", type)
            }
            let arrow = $arrows.at(#j)_#i$
            if i < 3 {
              edge((j, i), "d", "->", arrow)
            }
          }
        }
      }
    )
  )
]

#proof[
  Применив #link(<snake-lemma>)[лемму о змее] для верхней и нижней строки, получим, что $beta_2 compose beta_1 = 0$. Отсюда каждый столбец является комплексом, и, следовательно, диаграмма представляет КТП комплексов. Остается применить #link(<long-exact-seq-th>)[ДКП], которая и выдаст желаемое.
]

#definition[
  Квадрат ниже называется pullback (pushout), если он представляет собой предел (копредел).
  #align(center)[
    #diagram(
      cell-size: 15mm, 
      $
        A edge("->", f) edge("d", "->", alpha) & B edge("d", "->", beta, label-side: #left) \
        C edge("->", g) & D
      $,
      node((rel: (0.1, 0.1), to: (0, 0)), pullback),
      node((0.5, 0.5), "pb")
  )
  #h(25mm)
  #diagram(
      cell-size: 15mm, 
      $
        A edge("->", f) edge("d", "->", alpha) & B edge("d", "->", beta, label-side: #left) \
        C edge("->", g) & D
      $,
      node((rel: (-0.1, -0.1), to: (1, 1)), pushout),
      node((0.5, 0.5), "po")
  )]
]

#proposition[
  Квадрат является pullback'ом #iff $0 -> A ->_((f,alpha)) B plus.circle C ->_vec(-beta, g) D$ - точна.

  Аналогично квадрат является pushout'ом #iff $A ->_((f,alpha)) B plus.circle C ->_vec(-beta, g) D -> 0$ - точна.
  
  И является *универсальным* #iff $0 -> A ->_((f,alpha)) B plus.circle C ->_vec(-beta, g) D -> 0$ - точна.
]

#lemma("Об универсальном квадрате")[
  #align(center)[
    #diagram(cell-size: 7mm, 
      $
        ker(f) edge("d", "->", lambda) edge("hook->") & A edge("d", "->", alpha, label-side: #right) edge("->", f) & 
        B edge("d", "->", beta, label-side: #left) edge("->>") & coker(f) edge("d", "->", mu, label-side: #left) \
        ker(g) edge("hook->") & C edge("->", g, label-side: #right) & D edge("->>") & coker(g)
      $,
      node((1.5, 0.5), $S$)
    )
  ]
  1. $S$ - пуллбэк #iff $lambda$ - изоморфизм и $mu$ - мономорфизм
  + $S$ - пушаут #iff $lambda$ - эпиморфизм и $mu$ - изоморфизм
] <universal-square-lemma>

#proof[
  Достаточно доказать 1, так как второе получается по двойственности.

  $S$ - пуллбэк #iff $0 -> A ->_((f, alpha)) B plus.circle C ->_vec(-beta, g) D$ - точна #iff точна во всех членах. Аккуратно распишем:
  1. точность в $A$ #iff $(forall x in ker(f): thick alpha(x) = 0 #iff x = 0) #iff lambda$ - мономорфизм
  + точность в $B plus.circle C$ #iff $(forall b in B, c in C: beta(b) = g(c) #iff exists a in A: b = f(a), thin c = alpha(a)) #iff mu$ - мономорфизм и $lambda$ - эпиморфизм ($b = 0, c in ker(g)$)
]

#corollary[
  + $S$ - биуниверсальный #iff $lambda, mu$ - изоморфизмы
  + $S$ - пуллбэк $=>$ $f$ - моно #iff $g$ - моно
  + $S$ - пушаут $=>$ $f$ - эпи #iff $g$ - эпи
]

#theorem("Лемма Шанюэля")[
  Пусть даны две точные последовательности с общим крайним членом такие, где $P, P'$ - проективные. Тогда $U plus.circle P' tilde.eq U' plus.circle P$.
  #align(center)[
    #diagram(cell-size: 10mm,
      $
        edge("hook->") edge("dr", "--", stroke: #red) & edge("->>") edge("dl", "--", stroke: #blue) & A edge("d", "=") \
        edge("hook->") & edge("->>") & A \
      $,
      {
        node((0, 0), $U'$, shape: fletcher.shapes.circle, stroke: 0.1mm)
        node((1, 1), $P$, shape: fletcher.shapes.circle, stroke: 0.1mm)
        node((1, 0), $P'$, shape: rect, stroke: 0.1mm)
        node((0, 1), $U$, shape: rect, stroke: 0.1mm)
        node((0.5, 0.5), $plus.big$, )
      }
    ),
  ]
]

#proof[
  По свойству проективности $P'$ диаграмма достраивается до следующей:
  #align(center)[
    #diagram(cell-size: 10mm,
      $
        0 = ker(f) edge("->") & U' edge("hook->", f) edge("d", "->") & P' edge("->>") edge("d", "->") & A = coker(f) edge("d", "=") \
        0 = ker(g) edge("->") & U edge("hook->", g) & P edge("->>") & A = coker(g)
      $
    )
  ]
  По #link(<universal-square-lemma>)[лемме об универсальном квадрате] центральный квадрат является биуниверсальным, а значит последовательность $0 -> U' -> P' plus.circle U -> P -> 0$ точная, которая в силу проективности $P$ расщепляется и дает нужный изоморфизм.
]

#lemma("Лемма о двух квадратах")[
  Пусть дана следующая диаграмма, в которой строчки точные, а $Q$ это пуллбэк.
  #align(center)[
    #diagram(cell-size: 10mm, 
      $
        & A_1 edge("->", f_1) edge("dd", "->", alpha) & B_1 edge("->", g_1) edge("dd", "->", beta, bend: #(-25deg)) & C_1 edge("->") edge("dd", "->", gamma) & 0 \ \
        0 edge("->") & A_2 edge("->", f_2, label-side: #right) & B_2 edge("->", g_2, label-side: #right) & C_2
      $,
      {
        node((2, 1), $Q$, name: <Q>)
        node((rel: (10deg, 0.15), to: <Q>), text(rotate(-20deg, pullback), red))
        node((rel: (10deg, -0.15), to: <Q>), text(rotate(-20deg, pushout), blue))
        edge(<Q>, (2,2), "->", text($eta$, red), stroke: red, label-side: left)
        edge(<Q>, (3,0), "->", text($tau$, red), stroke: red, label-side: right)
        edge((1, 2), <Q>, text($exists phi$, blue), "-->", stroke: blue, "crossing", crossing-thickness: 20)
        edge((2, 0), <Q>, text($exists psi$, blue), "-->", stroke: blue)
      }
    )
  ]

  Тогда утверждается, что существуют синие стрелки, которые замыкают синий квадрат до пушаута.
]

#proof[
  Отображение $psi: B_1 -> Q$ строится по универсальному свойству пуллбэка, так как из $B_1$ есть две стрелки $g_1: B_1 -> C_1$ и $beta: B_1 -> B_2$, согласованные на $C_2$. Чтобы задать отображение $phi: A_2 -> Q$ возьмем два отображения $f_2: A_2 -> B_2$ и $0: A_2 -> C_1$, которые также согласованы в $C_2$.

  Так как $g_1$ эпиморфизм, а $g_1 = tau compose psi$, получаем, что $tau$ тоже эпиморфизм. Аналогично, $phi$ - мономорфизм. По #link(<universal-square-lemma>)[теореме об универсальном квадрате], $ker(tau) tilde.eq ker(g_2) = A_2$, а тогда $phi = ker(tau)$ и последовательность 
  $0 arrow.long A_2 arrow.long^phi Q arrow.long^tau C_1 arrow.long 0$ точная. Остается понять, что квадрат
  #align(center)[
    #diagram(cell-size: 7mm, 
      $
        ker(f) edge("->") edge("d", "->>") & A_1 edge("->", f_1) edge("d", "->", alpha) & B_1 edge("->", g_1) edge("->", "d", psi) & coker(g_1) = C_1 edge("d", "=") \    
        0 edge("->") & A_2 edge("->", phi) & Q edge("->", tau) & coker(g_1) = C_1 \    
      $
    )
  ]
  удовлетворяет условию пушаута, что и требовалось доказать.
] 

== Резольвенты
#definition[
  Инъективная резольвента #comment[TODO]
]
#definition[
  #comment[подъем отображения]
]
#theorem("Теорема о подъёме")[
  #comment[ДА ДА]
]
