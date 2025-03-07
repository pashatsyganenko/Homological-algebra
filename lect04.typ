#import "definitions.typ": *

#let dual = $cal(D)$;

#theorem[
  Конечнопорожденный модуль $bl(P, A)$ проективен #iff $dual(P)$ инъективен.
]
#proof[
  Пусть $P$ проективный модуль. Для доказательства инъективности $dual(P)$, достаточно проверить, что $dual(P) >->^i X$ расщепляется, $forall X in ModR(A)$. Рассмотрим два случая:

    + $X$ конечнопорожден. Применим функтор #dual. $dual(X) ->>^dual(i) dual^2(P) tilde.eq^phi P$ по свойству     проективности $P$ расщепляется: $dual(X) = dual^2(P) plus.circle Y$ и $dual(i) = "pr"_1$.
      #align(center, diagram(cell-size: 30mm, {
        let (X, P) = ((0, 0), (1, 0))
        node(X, $dual(X) = dual^2(P) plus.circle Y$)
        node(P, $dual^2(P)$)
        edge(X, P, "->>", $dual(i) = "pr"_1$)
      }))
      Применим $dual$ еще раз)
      #align(center, diagram(cell-size: 20mm, {
        let (X, P) = ((1, 0), (0, 0))
        let (DX, DP) = ((1, 0.8), (0, 0.8))
        node(X, $dual^2(X) = dual^3(P) plus.circle dual(Y)$)
        node(P, $dual^3(P)$)
        node(DX, $X$)
        node(DP, $dual(P)$)
        edge(X, P, "<-<", $dual^2(i)$, right)
        edge(DX, DP, "<-<", $i$, right)
        edge(X, DX, "=>", $eta_X$)
        edge(P, DP, $eta_dual(P)$, "=>")
      }))

      Получилось, что $i$ изоморфен расщепляющемуся морфизму, значит и сам расщепляется. 

    + Теперь пусть $X$ произвольный. Обозначим за $Q := dual(P)$, можем считать, что он подмодуль $X$. Тогда $X = lim_arrow.long M_alpha$, где $Q subset M_alpha <= X$ - конечнопорожденные подмодули, содержащие $Q$. По первому пункту, каждый модуль $M_alpha = N_alpha plus.circle Q$, и при этом существует морфизм трех диаграмм с общей направленной системой:
      #align(center, diagram(cell-size: 15mm, {
        let (Q, A, P) = ((0, 0), (1, 0), (2, 0))
        let (QQ, B, PP) = ((0, 0.8), (1, 0.8), (2, 0.8))
        node(A, $M_alpha = N_alpha plus.circle Q$)
        node(B, $M_beta = N_beta plus.circle Q$)
        node(Q, $Q$)
        node(P, $Q$)
        node(QQ, $Q$)
        node(PP, $Q$)
        edge(A, B, "hook->", $j_(alpha, beta)$)
        edge(Q, QQ, "=", $id$)
        edge(P, PP, "=", $id$)
        edge(Q, A, "hook->")
        edge(QQ, B, "hook->")
        edge(A, P, "->>")
        edge(B, PP, "->>")
        edge(Q, P, "->", $id$, bend:25deg)
        edge(QQ, PP, "->", $id$, bend:-25deg)
      }))

      где $j_(a,b)$ обыкновенное вложение $M_alpha$ в $M_beta$. Отсюда имеется отображение между прямыми пределами: $Q >->^i X ->^p Q$, которое и дает искомое расщепление, так как $lim_arrow.long$ это функтор, и следовательно $p compose i = id_Q$.
]

== Инъективные оболочки

Далле считаем $R$ ассоциативным кольцом с единицей, а $A$ конечномерной алгеброй над полем $KK$.

#definition[
  Подмодуль $N lt.eq.slant M$ называется существенным, если $forall 0 eq.not X lt.eq.slant M : N inter X eq.not 0$.
]

#definition[
  Пара $(bl(M,R) >->^i bl(Q,R),bl(Q,R))$ называется инъективной оболочкой модуля $bl(M,R)$, если
  + $Q$ инъективен и $i$ -- мономорфизм.
  + $Im(i)$ -- существенный подмодуль в $M$.
]

#definition[
  Цоколем модуля $bl(M,R)$ называется $Soc(M) = sum_(N lt.eq.slant M #text[\ прост]) N$.
]

#proposition[
  Цоколь -- существенный подмодуль.
]
#proof[
  Рассмотрим $X lt.eq.slant M$. Если $X$ простой, он лежит в цоколе, иначе возьмём ненулевой $x in X$, подмодуль $R x$ прост, поэтому $X inter Soc(M) supset.eq R x eq.not 0$.
]

#theorem[
  $bl(S,A)$ прост $arrow.double$ существует инъективная оболчка и она конечнопорождена. 
]
#proof[
  По как мы поняли ранее, $cal(D)(S)_A$ прост. Тогда по #numbered-link(<proj-cover-exists-th>)[теореме] у него существует проективное накрытие $P ->>^pi cal(D)(S)$, где $P$ -- главный неразложимый над $A$ (#comment[почему это так и зачем это нужно]). Применим к этой стрелке функтор $cal(D)$: $ S tilde.equiv^(sigma_p^(-1)) cal(D)^2 (S) >->^(cal(D)(pi)) cal(D)(P). $
  Будем считать, что $cal(D)(pi)$ действует из $S$ в $cal(D)(P)$. $cal(D)(P)$ инъективен, так что остаётся показать, что $Im(cal(D)(pi))$ существеннен. Допустим $exists X lt.eq.slant cal(D)(P) : X inter Im(cal(D)(pi)) = 0$. #comment[Дальше шиза]
]

#theorem[
  У любого модуля $bl(M,A)$ существует инъективная оболочка.
]
#proof[
  Рассмотрим вложение $Soc(M) >->^i M$. Уже знаем, что
  - $Soc(M)$ -- существенный подмодуль $M$
  - $Soc(M) = plus.circle.big_(alpha in I) S_alpha$, где все $S_alpha$ просты. #comment[Почему?]
  Как мы только что поняли, у каждого $S_alpha$ есть инъективная оболочка $S_alpha >->^(j_alpha) Q_alpha$, каждый $Im(j_alpha)$ существеннен в $Q_alpha$. Положим $Q = plus.circle.big_(alpha in I) Q_alpha$. Так как $A$ нётерово, по #numbered-link(<sum-injective-th>)[теореме] $Q$ инъективен.
  #align(center, diagram(cell-size: 7mm, label-size: 4mm, {
    let (A,B,C) = ((0,0),(1.5,0),(0,1))
    node(A,$Soc(M)$)
    node(B,$M$)
    node(C,$plus.circle.big_(alpha in I) Q_alpha$)
    edge(A,B,$i$,">->")
    edge(B,C,$exists g$,label-side: left,"-->")
    edge(A,C,$j := plus.circle.big_(alpha in I) j_alpha$,label-size: 2.7mm,"->")
  }))
  Получаем отображение $g: M -> Q$, $g i = j$. Проверим, что $g$ мономорфизм. Пусть $Ker(g) eq.not 0$, тогда по существенности $Soc(M) inter Ker(g) eq.not 0$, выберем ненулевой $x in Soc(M) inter Ker(g)$. $ j(x) = g i(x) = g(x) = 0 space arrow.double space x = 0. $
  Остаётся лишь сказать, почему образ $g$ существеннен. Действительно, $Im(g) supset.eq Im(j) = plus.circle.big_(alpha in I) Im(j_alpha)$, существенность последнего очевидным образом следует из существенности каждого $Im(j_alpha)$ в $Q_alpha$.\
]

#comment[2 (ДВА) СЛЕДСТВИЯ]

#theorem[
  Пусть $G$ -- конечная группа, $A = KK G$ -- её групповая алгебра. Тогда $bl(A,A) tilde.equiv cal(D)(A_A)$.
]
#proof[
  Определим $delta: A -> KK$, $sum_(g in G) alpha_g g |-> alpha_e$ и $f: bl(A,A) -> cal(D)(A_A)$, $a |-> a dot delta$.
  - $f$ -- $A$-линейный гомоморфизм. Очевидно.
  - $f$ -- мономорфизм. Пусть $a eq.not 0$ и $f(a) = a dot delta = 0$. У $a$ существует коэффициент $alpha_h eq.not 0$. Тогда получаем противоречие: $0 eq.not alpha_h = delta(h^(-1) a) = a dot delta(h^(-1)) = 0$.
  - $f$ -- эпиморфизм, так как это мономорфизм между пространствами одинаковой конечной размерности $dim_KK A = dim_KK cal(D)(A)$.
]

#corollary[
  В категории $RMod(KK G)$, $abs(G) < infinity$ классы проективных и инъективных модулей совпадают.
]
#proof[
  По #link(<mashke-th>)[теореме Машке] алгебра $KK G$ полупроста и поэтому распадается на прямую сумму простых подмодулей. В нашей терминологии эти простые слагаемые назывались главными неразложимыми. Отсюда имеем 
  $ A_1 plus.circle  dots plus.circle A_k = A tilde.eq D(A) = D(A_1) plus.circle dots plus.circle D(A_k) $

  и из единственности разложения получим, что главные неразложимые под действием #dual переходят в изоморфные главные неразложимые. 

  Тогда модуль $Q$ является инъективным #iff $dual(Q)$ является проективным #iff $dual(Q)$ является #link(<proj-desc-cor>)[прямой суммой главных неразложимых] #iff $Q tilde.eq dual^2(Q)$ является прямой суммой главных неразложимых #iff $Q$ проективен.
]

= Когомологии
== Комплексы

Напомним определение абелевой категории, а также теорему Фрейда — Митчелла, практический смысл которой заключается в следующем: вместо того, чтобы работать с абелевой категорией, можно перейти к некоторой категории модулей. Поэтому большинство конструкций в этом параграфе переносится на произвольные абелевы категории.
#align(center, diagram(cell-size: 15mm, node-stroke: 1pt, edge-stroke: 1pt, {
  let x = 0.7
  let (A,B,C,D) = ((0,x - 0.1),(0,2*x),(0,3*x),(0,4*x))
  node(A, [*Предаддитивная категория* -- категория, в которой морфизмы\ между любыми двумя объектами образуют аддитивную абелеву\ группу с дистрибутивностью относительно композиции ])
  node(B,[*Аддитивная категория* -- предаддитивная категория\ со всеми бинарными произведениями и копроизведениями])
  node(C,[*Предабелева категория* -- аддитивная категория\ со всеми ядрами и коядрами])
  node(D,[*Абелева категория* -- предабелева категория в которой,\ все мономорфизмы и эпиморфизмы нормальны])
  edge(A,B)
  edge(B,C)
  edge(C,D)
  }))

#theorem("Фрейда-Митчелла")[
  Пусть $scr(A)$ -- малая абелева категория. Тогда существует ассоциативное кольцо $R$ с единицей и строгий, полный, точный функтор $scr(A) -> RMod(R)$.
]

#definition[
  Последовательность $(X_circle.filled.small,d_circle.filled.small)$ модулей и гомоморфизмов $d_n : X_n -> X_(n+1)$ называется _комплексом_, если $forall k in ZZ : d_(k+1) d_k = 0$.
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    let (A,B,C,D,E) = ((-1,0),(0,0),(1,0),(-2,0),(2,0))
    node(A,$X_(n)$)
    node(B,$X_(n+1)$)
    node(C,$X_(n+2)$)
    edge(A,B,$d_n$,"->")
    edge(B,C,$d_(n+1)$,"->")
    node(D,$dots.c$)
    node(E,$dots.c$)
    edge(D,A,"->")
    edge(C,E,"->")
  }))
]

#definition[
  Морфизмом комплексов $(X_circle.filled.small,d^X_circle.filled.small)$ и $(Y_circle.filled.small,d^Y_circle.filled.small)$ называется семество отображений $h_circle.filled.small = {h_k : X_k -> Y_k}_(k in ZZ)$ такое, что $forall k in ZZ : d^Y_n h_n = h_(n+1) d^X_n$.
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    let (A,B,C,D,E) = ((-1,0),(0,0),(1,0),(-2,0),(2,0))
    let (Y1,Y2,Y3,Y4,Y5) = ((-2,1),(-1,1),(0,1),(1,1),(2,1))
    node(A,$X_(n)$)
    node(B,$X_(n+1)$)
    node(C,$X_(n+2)$)
    edge(A,B,$d^X_n$,"->")
    edge(B,C,$d^X_(n+1)$,"->")
    node(D,$dots.c$)
    node(E,$dots.c$)
    edge(D,A,"->")
    edge(C,E,"->")
    node(Y1,$dots.c$)
    node(Y2,$Y_n$)
    node(Y3,$Y_(n+1)$)
    node(Y4,$Y_(n+2)$)
    node(Y5,$dots.c$)
    edge(Y1,Y2,"->")
    edge(Y2,Y3,$d^Y_n$,"->")
    edge(Y3,Y4,$d^Y_(n+1)$,"->")
    edge(Y4,Y5,"->")
    edge(A,Y2,$h_n$,label-side: left,"->")
    edge(B,Y3,$h_(n+1)$,label-side: left,"->")
    edge(C,Y4,$h_(n+2)$,label-side: left,"->")
  }))
]