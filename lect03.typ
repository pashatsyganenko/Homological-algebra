#import "definitions.typ": *

#corollary[
  Если модуль $S$ над конечномерной алгеброй прост, то существует главный неразложимый модуль $P$ такой, что $S tilde.equiv P / (J(A) P)$.
]

#corollary[
  Если алгебра $A$ полупроста, то любой модуль $M_A$ можно представить как $plus.circle.big_(i in I) P_i/(J(A) P_i)$.
]

#theorem[
  #comment[ТУТ ТЕОРЕМА ПРО СУЩЕСТВОВАНИЕ ПРОЕКТИВНОГО НАКРЫТИЯ]
]

#corollary[
  #comment[ТУТ СЛЕДСТВИЕ ПРО ГЛАВНЫЕ НЕРАЗЛОЖИМЫЕ]
]

== Инъективные модули

#definition[
  Модуль $Q_R$ называется проективным, если $ forall f : X >-> Y quad forall g : X -> Q quad exists h: Y -> Q : g = h f. $
  #align(center, diagram(cell-size: 15mm, {
  let (X,Y,Q) = ((0,0),(1,0),(0,0.7))
  node(Q, $Q$)
  node(X, $X$)
  node(Y, $Y$)
  edge(X, Y,  label-side: left, $forall f$, ">->")
  edge(X, Q, $forall g$, "->") 
  edge(Y, Q, label-side: left, $exists h$, "-->")
  }))]

#lemma[
  + $Q$ инъективен #iff Любой мономорфизм из $Q$ расщепим, то есть $forall Q >->^i X quad exists h : X -> Q : $ #comment[ЫЫЫЫЫ ДА ЫЫЫЫЫЫ]
]
#comment[Тут какая-то дыра в конспекте как будто.]

#definition[
  Модуль $M_R$ над ассоциативном кольцом с единицей называется делимым, если для всех $r in R$ уравнение $r x = y$ разрешимо относительно $x$ и $y$, то есть $ forall r in R quad forall y in M quad exists x in M : r x = y. $
]

#note[
  Это условие эквивалентно тому, что $forall r in R : r M = M$.
]
#comment[Лев, во-первых разберись пж почему замечание съехало, во-вторых проверь определение и замечание, а то у меня в конспекте какие-то $x = y slash r$, это просто условность?]

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
Понятно, что $W eq.not diameter$. Пусть $(Z_1,h_1) prec.curly.eq (Z_2,h_2) iff Z_1 subset.eq Z_2 " и " h_2|_Z_1 = h_1$. Если $cal(C)$ -- цепь в $W$, то $(union.big_((Z,h) in cal(C)) Z, H)$, где $H$ продолжает все $h$, является её верхней гранью. Тогда по лемме Цорна существует максимальный элемент $(T,g)$. Предположим, что $T eq.not Y$, пусть $t in Y without T$. Определим $J = {r in R | r b in T}$ и $s : J -> M$ как $s(r) = g(r b)$. По предположению $s$ продолжается до отображения $k: R -> M$. Пусть $N = T + R b supset.neq T$, $N subset.eq Y$. Положим $q: N -> M$ как $q(t) = g(t)$ для всех $t in T$ и $q(r b) = k(r)$ для $r in R$. Так как $T inter R b = J b$ и для всех $r in J$ имеем $g(r b) = s(r) = $ $k(r)$, то $q$ корректно определён. Получили $(T,g) prec.curly.eq (N,q)$, что противоречит максимальности.

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
#comment[Скам, который в итоге вроде не скам.]