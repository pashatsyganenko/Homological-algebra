#import "definitions.typ": *

#corollary[
  $Rad(attach(A, bl: A)) = attach(J(A), bl: A), Rad(attach(A, br: A)) = attach(J(A), br: A)$ и $Rad(A) = J(A)$ (в коммутативном случае).
]

Ниже под $R$ понимается ассоциативное кольцо с единицей.
#definition[
  Подмодуль $X$ модуля $M_R$ называется малым, если для всякого $K lt.eq.slant M$\ из $X+K=M$ следует $K = M$.
]

#lemma[
  Пусть $A$ -- конечномерная алгебра, $M_R$ -- правый $A$-модуль. Тогда
  + Любой малый подмодуль $M$ лежит в $Rad(M)$.
  + $Rad(M)$ есть сумма малых модулей.
]
#proof[
  + Пусть имеется малый подмодуль $N subset.eq.not Rad(M)$. Тогда существует максимальный подмодуль $U$, не содержащий $N$. Из максимальности $U$ следует $N + U = M$, а значит $U = M$. Противоречие с максимальностью $U$.
  + $Rad(M) = sum_(x in Rad(M)) A x$. Покажем, что каждый $A x$ мал. "Дело за малым" - А. В. Семёнов.\
  Пусть $A x + K = M$, проверим, что $K = M$.
  $ M arrow.twohead^(pi_1) M/K = (A x)/(A x inter K) =: D_A tilde.equiv^(pi_2) A/Ker((A arrow.long_(1 arrow.bar x) M)) arrow.twohead^(pi_3) A/I = S. $
  Первое равенство получено по второй теореме об изоморфизме. $D_A$ -- циклический модуль. $I$ -- некоторый максимальный подмодуль, в который вложено ядро. $S$ -- простой модуль.\
  Положим $f = pi_3 pi_2 pi_1 : M -> S$ -- эпиморфизм в простой модуль. Значит $Ker(f)$ -- максимальный подмодуль $M$, тогда $x in Ker(f)$ так как он изначально брался из радикала.\
  $K subset.eq Ker(f)$ так как $K subset.eq Ker(pi_1)$. Получаем, что $Ker(f) = M$. Противоречие.
]

#theorem[
  Если $A$ -- конечномерная алгебра и $M_A$ -- модуль, то $Rad(M)$ мал.
]
#proof[
  + Пусть $M$ конечнопорождён. Тогда $Rad(M)$ конечнопорождён по #comment[У МЕНЯ НАПИСАНО НЁТЕРОВОСТИ, НО НАДО ПРОВЕРИТЬ]. Тогда можно считать, что радикал представляется конечной суммой малых модулей. Остаётся показать, что сумма двух малых мала. Действительно, $(N_1 + N_2) + K = M  arrow.double.long N_2 + K = M arrow.double.long K = M$.
  + #align(center, scam-alert[
    $M = lim_(arrow^n) M_n$, где $M_n$ конечнопорождённые. $Rad(M) = lim_(arrow^n) Rad(M_n)$ так как радикал сохраняется при гомоморфизмах. Тогда $Rad(M)$ мал так как $ |Rad(M)-Rad(M_n)| < epsilon arrow.double Rad(M) + K = M. $
  ])
]

= Проективные модули
== Свойства

#definition[
  Модуль $P_R$ называется проективным, если $ forall f : P -> N quad forall sigma : M arrow.twohead N quad exists g: P -> M : f = sigma g. $
  #align(center, diagram(cell-size: 15mm, {
  let (P,M,N) = ((1,0),(0,1),(1,1))
  node(P, $P$)
  node(M, $M$)
  node(N, $N$)
  edge(P, N,  label-side: left, $forall f$, "->")
  edge(P, M, $exists g$, "-->") 
  edge(M, N, label-side: right, $forall sigma$, "->>")
  }))]

#lemma[
  Любой свободный модуль проективен.
]
#proof[
  Рассмотрим свободный модуль $F$ и зафиксируем диаграмму #align(center, diagram(cell-size: 15mm, {
    let(M,N,F) = ((0,0),(1,0),(2,0))
    node(M,$M$)
    node(N,$N$)
    node(F,$F$)
    edge(M, N, $sigma$, "->>")
    edge(N, F, $f$, "<-")
  }))
  Пусть ${w_j}_(j in I)$ -- базис $F$, $f(w_j) = y_j$. Так как $sigma$ сюръективно, $forall j in I : exists x_j in M : sigma(x_j) = y_j $.

  Положив $g(w_j) = x_j$, замкнём диаграмму до коммутативной:
  #align(center, diagram(cell-size: 15mm, {
    let(M,N,F) = ((0,0),(1,0),(2,0))
    node(M,$M$)
    node(N,$N$)
    node(F,$F$)
    edge(M, N, $sigma$, "->>")
    edge(N, F, $f$, "<-")
    edge(F, M, $g$, bend: 30deg, "->")
  }))
]

#theorem[
  $P$ -- проективный #iff $forall sigma : M ->> P quad exists i : P -> M : sigma i = id_P$.
]
#proof[
  $arrow.double$: Фиксируем $sigma: M ->> P$. Взяв в определении проективного модуля $N = P$ и $f = id_N$ получаем требуемое $i$.\
  $arrow.double.l$: Рассмотрим $U = {(p,m) in P plus.circle M | f(p) = sigma(m)}$ вместе с проекциями $U ->^(pi_1) P$ и $U ->^(pi_2) M$.
  #align(center, diagram(cell-size: 15mm, {
  let (U,P,M,N) = ((0,0),(1,0),(0,1),(1,1))
  node(U,$U$)
  node(P,$P$)
  node(M,$M$)
  node(N,$N$)
  edge(U, P, $pi_1$, bend: -10deg, "->")
  edge(U, M, $pi_2$, "->")
  edge(P, N, label-side: left, $f$, "->")
  edge(M, N, $sigma$, "->>")
  edge(P, M, label-side: left, $g$, "-->")
  edge(P, U, $j$, bend: -20deg, "->")
  }))
  Из эпиморфности $sigma$ следует эпиморфность $pi_1$, значит по условию $exists i: P -> U : pi_1 i = id_P$.\
  Тогда $g = pi_2 j$ замыкает диаграмму, так как $forall x in P$ $ sigma g (x) = sigma pi_2 j (x) = sigma(pi_2 (x,m)) = sigma(m) = f(x). $
]

#lemma[
  Если $P = plus.circle.big_(k in I) P_k$, то $P$ -- проективен #iff все $P_k$ проективны.
]
#proof[
  $arrow.double$: Рассмотрим произвольный $P_k$ и покажем, что он проективен.
  #align(center, diagram(cell-size: 15mm, {
  let (P,Pk,M,N) = ((0,0),(1.6,0),(-1,0),(0,0.6))
  node(P,$P = plus.circle.big_(k in I) P_k$)
  node(Pk,$P_k$)
  node(M,$M$)
  node(N,$N$)
  edge(Pk, N, label-side: left, $f$, bend:20deg, "->")
  edge(M, N, $sigma$, label-side: right, "->>")
  edge(P, Pk, $pi_k$, bend: 12deg, "->>")
  edge(Pk, P, $i_k$, bend: 12deg, ">->")
  edge(P, M, $g$, "->")
  edge(Pk, M, $g_k$, bend: -50deg, label-side: left, "-->")
  }))
  Из проективности $P$ следует существование $g: P -> M : f pi_k = sigma g$. Тогда нам подходит $g_k = g i_k$: $ f = f pi_k i_k = sigma g i_k = g i_k. $
  $arrow.double.l$: Из проективности $P_k$ следует существование $g_k : P_k -> M : sigma g_k = f i_k$.\
  Положим $g = plus.circle.big_(k in I) g_k pi_k$, тогда $ sigma g = plus.circle.big_(k in I) sigma g_k pi_k = plus.circle.big_(k in I) f i_k pi_k = f compose plus.circle.big_(k in I) i_k pi_k = f. $
  #align(center, diagram(cell-size: 15mm, {
  let (P,Pk,M,N) = ((0,0),(1.6,0),(-1,-0.5),(-1,0.5))
  node(P,$P = plus.circle.big_(k in I) P_k$)
  node(Pk,$P_k$)
  node(M,$M$)
  node(N,$N$)
  edge(P, N, label-side: left, $f$, "->")
  edge(M, N, $sigma$, label-side: right, "->>")
  edge(P, Pk, $pi_k$, bend: 12deg, "->>")
  edge(Pk, P, $i_k$, bend: 12deg, ">->")
  edge(P, M, $g$, "-->")
  edge(Pk, M, $g_k$, bend: -30deg, label-side: left, "->")
  }))
]

#corollary[
  $P$ -- проективен #iff $P$ -- прямое слагаемое свободного.
]
#proof[\
  $arrow.double$: Для любого проективного модуля $P$ существует свободный модуль $F$ и эпиморфизм $F ->> P$ (можно взять свободный модуль на образующих $P$). Из проективности $P$ следует существование $i: P -> F : pi i = id_P$. Тогда $exists X lt.eq.slant F : F = X plus.circle i(P) tilde.equiv X plus.circle P.$ #comment[можно добавить в первую лекцию теорему о диаграмме прямой суммы и сослаться на неё]\
  $arrow.double.l$: Очевидно следует из лемм 3 и 4. #comment[потом можно ссылки добавить, мне впадлу]
]

== Проективные накрытия
Пусть $A$ -- конечномерная алгебра над полем $K$.
#definition[
  Можно представить $A_A$ как $A_A = plus.circle.big_(j=1)^n P_j$, где все $P_j$ неприводимые. Они называются главными неразложимыми модулями.
]
Все $P_j$ проективны так как $A$ свободна как модуль над собой.

#definition[
  Кольцо $R$ называется локальным, если у него всего один максимальный идеал.
]

#properties
+ Этот максимальный идеал состоит из всех необратимых элементов. Действительно, если бы существовал другой необратимый элемент, то он бы содержался в некотором другом максимальном идеале.
+ $R slash Rad(R)$ -- тело. На самом деле это критерий локальности, так как $Rad(R)$ максимален _iff_ $Rad(R)$ единственный максимальный.
+ $1-x$ необратим #iff $x$ обратим. Следует из известного факта про описание радикала Джекобсона, в нашем случае он совпадает с единственным максимальным идеалом.

#definition[
  $(P_A, pi: P ->> M_A)$ -- проективное накрытие модуля $M$ #iff $Ker(pi)$ мало.
]

#theorem[
  Если проективное накрытие существует, то оно единственно с точностью до изоморфизма.
] <proj-cover-unique-th>
#proof[
  Пусть существуют проективные накрытия $(P_1, pi: P_1 ->> M)$ и $(P_2, pi: P_2 ->> M)$. Из проективности $P_1$ следует существование $f: P_1 -> P_2 : pi_2 f = pi_1$. Проверим, что это изоморфизм.
  #align(center, diagram(cell-size: 15mm, {
    let (P1,M,P2) = ((0,0),(1,0.4),(0,0.8))
    node(P1,$P_1$)
    node(P2,$P_2$)
    node(M,$M$)
    edge(P1, P2, $f$, "->")
    edge(P1, M, $pi_1$, "->>")
    edge(P2, M, $pi_2$, label-side: right, "->>")
  }))
  - Эпиморфность. $Im(f) + Ker(pi_2) = P_2$. #comment[вроде это очев, но я уже совсем мясо чтобы думать]. Так как $Ker(pi_2)$ мало, то $Im(f) = P_2$, то есть сюръективность доказана.
  - Мономорфность. По только что доказаной эпиморфности $f$ расщепляется, то есть $exists i : P_1 -> M : f i = id_(P_1)$. #comment[добавить ссылк на теорему 6, а в ней добавить слово расщепимость].\
    Значит $exists X lt.eq.slant P_1 : Ker(f) plus.circle X = P_1$. Ядро $f$ тоже мало, так как $Ker(f) subset.eq Ker(pi_1)$ и подмодуль малого модуля мал. Получаем, что $Ker(f) = 0$.
]

#theorem[
  $S_A$ -- просто $med arrow.double.long med$ $exists (P, pi : P ->> S)$ -- проективное накрытие. // костыльны, конечно, эти med
]
#proof[
  $exists pi : A_A ->> S$. Представим $A$ как $A = plus.circle.big_(j=1)^n P_j$.
  $ S = Im(pi) = sum_(j=1)^n underbrace(pi(P_j), lt.eq.slant S) quad arrow.double.long quad pi(P_k) = S. $
  Предположим, что $Ker(pi) + X = P$, но $X eq.not P$. Тогда $pi(X) = pi(Ker(pi)+X) = pi(P) = S$.\
  Пусть $pi_1 = pi|_X: X ->> S$. По проективности $P$ существует $f : P -> X : pi = pi_1 f = pi j f$.
  #align(center, diagram(cell-size: 15mm, {
    let (X,S,P) = ((0,0),(1,0),(1,1))
    node(X,$X$)
    node(S,$S$)
    node(P,$P$)
    edge(X, S, $pi_1$, "->>")
    edge(P, S, $pi$, "->>")
    edge(X, P, $j$, bend: 15deg, ">->")
    edge(P,X, $f$, bend: 15deg, "->")
  }))
  Примем без доказательства, что $"End"(P_A)$ -- локальное кольцо. #comment[Надо бы объяснить почему так.]
  Так как $pi(1-j f) = 0$, то $1- j f$ необратим и $j f$ обратим. Значит $j$ эпиморфизм и $X = P$.
]