#import "definitions.typ": *

#comment[ТУТ ПРОПУЩЕН КУСОК]

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
$arrow.double.l$:
]

#lemma[
  Пусть $R$ -- кольцо главных идеалов. Тогда $M$ делимый #iff $M$ инъективный.
]
#proof[

]

#theorem[
  Пусть $R$ нётерово слева. Тогда $plus.circle.big_(i in I) M_i$ инъективен #iff $forall i in I : M_i$ инъективен.
]
#proof[

]

== Двойственность
#comment[Скам, который в итоге вроде не скам.]