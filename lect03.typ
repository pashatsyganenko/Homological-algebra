#import "definitions.typ": *

#corollary[
  Если модуль $S$ над конечномерной алгеброй прост, то существует главный неразложимый модуль $P$ такой, что $S tilde.equiv P / (J(A) P)$.
] <semisimple-as-undecomposable>
#proof[
  Из доказательства теоремы выше видно, что существует главный неразложимый модуль $P ->>^f S$. Ядро накрытия $f$ является малым модулем и следовательно содержится в $Rad(P) = J(A)P$. Однако так как модуль $S$ является полупростым, то #box($0 = Rad(S) = Rad((P slash ker(f))) = Rad(P) slash ker(f)$), из чего имеем $ker(f)= Rad(P) = J(A)P$.
]

#corollary[
  Любой полупростой модуль $M_A$ можно представить как $plus.circle.big_(i in I) P_i/(J(A) P_i)$.
]

#theorem[
  У любого модуля $M_A$ существует проективное накрытие.
] <proj-cover-exists-th>
#proof[
  Обозначим за $overline(A) = A slash J(A)$ и рассмотрим $overline(A)$-модуль $overline(M) := M/(J(A)M)$, который по #link(<semisimple-note>)[замечанию о полупростоте кольца], будет являться полупростым модулем. По тому же замечанию модуль $overline(M)$ представляется в виде 
  $ overline(M)_overline(A) = plus.circle.big_(i in I) S_i $где $S_i$ - простые $overline(A)$-модули. 
  
  Отображение факторизации $A ->>^p overline(A)$ задает функтор из $RMod(overline(A)) -> RMod(A)$, который превращает произвольный #box($overline(A)$+"-модуль") $N$ в $A$-модуль последующим образом: $a dot n = p(a) dot n, forall a in A, forall n in N$. Нетрудно убедится в аддитивности данного функтора, откуда имеем разложение уже над кольцом $A$:
  $ M_A = plus.circle.big_(i in I) S_i $
  где $S_i$ - по-прежнему простые, но уже $A$-модули. По #link(<semisimple-as-undecomposable>)[следствию выше], каждый $S_i = P_i slash J P_i$, где $P_i$ - это главный неразложимый модули, а $J := J(A)$. Обозначим за $pi_i: P_i ->> S_i$ и определим 
  $ pi := plus.circle.big_(i in I) pi_i: plus.circle.big_(i in I) P_i ->> overline(M) = plus.circle.big_(i in I) S_i $
  тогда $ker(pi) = plus.circle.big_(i in I)ker(pi_i) = plus.circle.big_(i in I)J P_i = J (plus.circle.big_(i in I) P_i) = J P = Rad(P)$, что является малым модулем, где $P := plus.circle.big_(i in I) P_i$.

  Итого, мы построили проективное накрытие модуля $overline(M)$. Остается заметить, что $P$ это проективный модуль как прямая сумма проективных, и потому имеет место следующая диаграмма:

  #align(center, diagram(cell-size: 15mm, {
    let (P,M,MM) = ((1,0),(0,1),(1,1))
    node(P, $P$)
    node(M, $M$)
    node(MM, $overline(M)$)
    edge(P, MM,  label-side: left, $pi$, "->>")
    edge(P, M, $exists tilde(pi)$, "-->") 
    edge(M, MM, label-side: right, $sigma$, "->>")
  }))

  По коммутативности диаграммы, во-первых, получаем $ker(tilde(pi)) subset ker(pi)$, откуда следует малость $ker(tilde(pi))$, а во-вторых, что $M = im(tilde(pi)) + ker(sigma) = im(tilde(pi)) + Rad(M) => im(tilde(pi)) = M$. 
  
  А тогда $tilde(pi): P ->> M$ - искомое проективное накрытие.
]

#corollary[
  Если $P$ - проективный модуль, то $P = plus.circle.big ("главных неразложимых")$
]

#proof[
  Из доказательства #numbered-link(<proj-cover-exists-th>)[Теоремы] видно, что проективное накрытие можно получить как прямую сумму главных неразложимых. Остается понять, что $id: P ->> P$ является проективным накрытием и воспользоваться #link(<proj-cover-unique-th>)[теоремой единственности]. 
]

== Инъективные модули

#definition[
  Модуль $Q_R$ называется инъективным, если $ forall f : X >-> Y quad forall g : X -> Q quad exists h: Y -> Q : g = h f. $
  #align(center, diagram(cell-size: 15mm, {
  let (X,Y,Q) = ((0,0),(1,0),(0,0.7))
  node(Q, $Q$)
  node(X, $X$)
  node(Y, $Y$)
  edge(X, Y,  label-side: left, $forall f$, ">->")
  edge(X, Q, $forall g$, "->") 
  edge(Y, Q, label-side: left, $exists h$, "-->")
  }))
]
#note[
  Понятие инъективного модуля является двойственным к понятию проективного модуля. Двойственность нужно понимать как двойственность в категорном смысле, где каждое утверждение про инъективные модули получается (и доказывается) из утверждения про проективные модули, заменой стрелок на противоположные. Примеры таких утверждений приводятся ниже.
]

#lemma[
  + $Q$ инъективен #iff Любой мономорфизм из $Q$ расщепим, то есть $forall Q >->^i X$, $i(Q)$ - прямое слагаемое X.
  + $product_(i in I) Q_i "инъективен" #iff Q_i "инъективен", forall i in I$  
]

#definition[
  Модуль $bl(M, R)$ над ассоциативном кольцом с единицей называется делимым, если для всех $r in R$ уравнение $r x = y$ разрешимо относительно $x$ и $y$, то есть $ forall r in R quad forall y in M quad exists x in M : r x = y. $
]

#note[
  Это условие эквивалентно тому, что $forall r in R : r M = M$.
]

Следующее утверждение на лекции было дано без доказательства, но для полноты изложения мы его привели.
#proposition("Критерий Бэра")[
  Если $R$ нётерово, то инъективность $M$ равносильна тому, что любой гомоморфизм ($R$-модулей) из идеала $I subset.eq R$ в $M$ продолжается до гомоморфизма на всём $R$.
  #align(center, diagram(cell-size: 15mm, {
  let (I,R,M) = ((0,0),(1,0),(0,0.7))
  node(I, $I$)
  node(R, $R$)
  node(M, $M$)
  edge(I, R, $i$, "hook->")
  edge(I, M, $forall f$, "->") 
  edge(R, M, label-side: left, $exists g$, "-->")
  }))
]
#proof[
$arrow.double:$ Следует из определения.\
$arrow.double.l$: Рассмотрим мономорфизм $X >-> Y$. Будем мыслить $X$ как подмодуль $Y$. Пусть $f: X -> M$. $ W = {(Z,h) | h: Z -> M, space X subset.eq Z subset.eq Y, space h|_X = f }. $
Понятно, что $W eq.not diameter$. Пусть $(Z_1,h_1) prec.curly.eq (Z_2,h_2) iff Z_1 subset.eq Z_2 " и " h_2|_Z_1 = h_1$. Если $cal(C)$ -- цепь в $W$, то $(union.big_((Z,h) in cal(C)) Z, H)$, где $H$ продолжает все $h$, является её верхней гранью. Тогда по лемме Цорна существует максимальный элемент $(T,g)$. Предположим, что $T eq.not Y$, пусть $t in Y without T$. Определим $J = {r in R | r t in T}$ и $s : J -> M$ как $s(r) = g(r t)$. По предположению $s$ продолжается до отображения $k: R -> M$. Пусть $N = T + R t supset.neq T$, $N subset.eq Y$. Положим $q: N -> M$ как $q(t) = g(t)$ для всех $t in T$ и $q(r b) = k(r)$ для $r in R$. Так как $T inter R b = J b$ и для всех $r in J$ имеем $g(r b) = s(r) = $ $k(r)$, то $q$ корректно определён. Получили $(T,g) prec.curly.eq (N,q)$, что противоречит максимальности.

]

#lemma[
  Пусть $R$ -- кольцо главных идеалов. Тогда $M$ делимый #iff $M$ инъективный.
]
#proof[
$arrow.double:$ Воспользуемся критерием Бэра, продолжим отображение $f: I -> M$ на всё $R$. Пусть $I = angle.l r angle.r$. По делимости $ exists x in M : r x = f(r)$. Тогда отображение $g: R -> M$, $1 |-> x$ продолжает $f$ так как $g(r) = r x = f(r)$.\
$arrow.double.l:$ Выберем $r in R$ и $y in M$. Отображение $f : r R -> M$, $r |-> y$ продолжимо до $g: R -> M$. Тогда $ y = f(r) = g(r) = r g(1). $
]

#theorem[
  Пусть $R$ нётерово слева. Тогда $plus.circle.big_(i in I) M_i$ инъективен #iff $forall i in I : M_i$ инъективен.
]
#proof[
#comment[ДОБАВЛЮ ПОЗЖЕ]
]

== Двойственность
Как обычно, $A$ - конечномерная алгебра над полем $KK$. Обозначим за $RMod(A)$ и $ModR(A)$ категории левых и правых конечнопорожденных модулей соответственно.

#let dual = $cal(D)$;
Определим контрвариантный функтор $dual: RMod(A) -> ModR(A) $ по следующему правилу:
- *на объектах*: $dual(X) := Hom(KK, X, KK)$, $forall X in RMod(A)$. 
  
  Структура правого модуля на $dual(X)$ задается как: $(f dot a)(x) = f(a dot x), thick forall f in Hom(KK, X, KK), a in A$

- *на морфизмах*: $dual(f) = Hom(KK, f, KK): dual(Y) -> dual(X)$, $forall f: X -> Y$, где отображение $D(f)$ определяется коммутативной диаграммой:
  #align(center, diagram(cell-size: 20mm, {
    let (X,Y,K) = ((0,0),(1,0),(1,0.7))
    node(X, $X$)
    node(Y, $Y$)
    node(K, $KK$)
    edge(X, Y, $f$, "->")
    edge(Y, K, label-side: left, $phi$, "->", )
    edge(X, K, label-side: right, $dual(f)(phi)$, "->")
  }))
  где $phi in dual(Y)$, а $dual(f)(phi) = phi compose f in dual(X)$

#lemma[
  Функтор $dual$ обладает следующими свойствами:
  + $dim_KK (X) = dim_KK (dual(X))$
  + Если $f$ - мономорфизм, тогда $dual(f)$ - эпиморфизм
  + Существует естественный изоморфизм между $dual^2 tilde.eq Id$
]

#proof[
  + Так как любой конечнопорожденный модуль имеет конечную размерность над $KK$, то первое утверждение следует из базого курса линейной алгебры.
  + Расшифруем утверждение о том, что значит, что $dual(f)$ - эпиморфизм: $forall psi in dual(X) thick exists phi in dual(Y): psi = phi compose f$. Диаграммно это будет выглядеть так:
    #align(center, diagram(cell-size: 20mm, {
      let (X,Y,K) = ((0,0),(1,0),(0,0.7))
      node(X, $X$)
      node(Y, $Y$)
      node(K, $KK$)
      edge(X, Y, $f$, ">->")
      edge(Y, K, label-side: left, $exists? phi$, "-->", )
      edge(X, K, label-side: right, $psi$, "->")
  }))
    То есть вопрос о сюръективности $dual(f)$ сводится к вопросу о возможности продолжения $psi$ с подпространства $X$ на $Y$, что, конечно же, верно.
  + Снова возвращение к базовому курсу линейной алгебры.
]

#lemma[
  Если $S$ это простой модуль над $A$, тогда $dual(S)$ также простой модуль.
]
#proof[
  #scam-alert[
    _Oopsie-woopsie UWU_
  ]
]

