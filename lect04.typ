#import "definitions.typ": *


#comment[ДА, ПОКА ТОЛЬКО САМОЕ ПРОСТОЕ]





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