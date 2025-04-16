#import "definitions.typ": *

#comment[ТУТ ЕЩЁ ПРО EXT, НО СНАЧАЛА ЛУЧШЕ ЛЕКЦИЮ 7 ЗАПИСАТЬ]

= Группы расширений
== Сложение Бэра

Рассмотрим короткую точную последовательность $A >->^alpha B ->>^beta C$, назовём её $E$, и стрелку $f: C' -> C$. Построим пулбэк $f$ и $beta$, пусть это $B_1$ со стрелками $beta_1 : B_1 -> C'$ и $h: B_1 -> B$. Тогда $beta_1$ тоже эпиморфизм. #footnote[#h(1mm) Если это не очевидно, то подробнее тут: #link("https://math.stackexchange.com/questions/1299488/the-pushout-of-an-epimorphism-is-an-epimorphism")] Заведём дополнительно нулевую стрелку из $A$ в $C$. Тогда взяв предел получим единственное $alpha_1 : A -> B_1$ такое, что $beta_1 alpha_1 = 0$ и $h alpha_1 = alpha$. Заметим, что подходит $alpha_1 = ker(beta_1)$ #comment[в каком плане?]

#align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    let (B1,CC,A,B,C) = ((1,0.3),(2,-0.3),(0,1),(1,1),(2,1))
    node(B1,$B_1$)
    node(CC,$C'$)
    node(A,$A$)
    node(B,$B$)
    node(C,$C$)
    edge(A,B,$alpha$,">->",label-side:right)
    edge(B,C,$beta$,"->>", label-side:right)
    edge(CC,C,$f$,"->",label-side:left)
    edge(B1,CC,$beta_1$,"->>",label-side:right)
    edge(B1,B,$h$,"->",label-side:left)
    edge(A,B1,$exists! alpha_1$,"-->",label-pos:90%)
    edge(A,CC,bend:50deg,$0$,"->")
  }))

#definition[
  Пусть $E: space A >-> B ->> C$ -- короткая точная последовательность, $f: C' -> C$.\ За $f^* (E)$ обозначается верхняя строка в диаграмме, которую мы только что построили:
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    let (A,B,C,D,E,F) = ((0,0),(1,0),(2,0),(0,1),(1,1),(2,1))
    node(A,$A$)
    node(B,$B_1$)
    node(C,$C'$)
    node(D,$A$)
    node(E,$B$)
    node(F,$C$)
    edge(A,B,$alpha_1$,">->")
    edge(B,C,$beta_1$,"->>")
    edge(A,D,"=")
    edge(D,E,$alpha$,">->")
    edge(E,F,$beta$,"->>")
    edge(B,E,$h$,"->")
    edge(C,F,$f$,"->")
  }))
]

Аналогичным образом, имея короткую точную последовательность $A >->^alpha B ->>^beta C$ и стрелку $g: A -> A'$ можно построить пушаут $g$ и $alpha$, назовём его $A' ->^(alpha_1) B_1 <-^h B$. Тогда $alpha_1$ -- мономорфизм. Также заводим нулевую стрелку $A' -> C$ и получаем единственную $beta_1 : B_1 -> C$ такую что $beta_1 alpha_1 = 0$ и $beta_1 h = beta$. В качестве такой стрелки подходит $beta_1 = coker(alpha_1)$.
#align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    let (A,B,C,A1,B1) = ((0,0),(1,0),(2,0),(0,1.3),(1,0.7))
    node(A,$A$)
    node(B,$B$)
    node(C,$C$)
    node(A1,$A'$)
    node(B1,$B_1$)
    edge(A,A1,$g$,"->")
    edge(A,B,$alpha$,">->")
    edge(B,C,$beta$,"->")
    edge(A1,B1,$alpha_1$,">->")
    edge(B1,C,$exists! beta_1$,"-->",label-side:right,label-pos:20%)
    edge(B,B1,$h$,"->")
    edge(A1,C,$0$,"->",bend:-50deg)
  }))

#definition[
  Пусть $E: space A >-> B ->> C$ -- короткая точная последовательность, $g: A -> A'$.\ За $g_* (E)$ обозначается нижняя строка в диаграмме, которую мы только что построили:
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    let (A,B,C,D,E,F) = ((0,0),(1,0),(2,0),(0,1),(1,1),(2,1))
    node(A,$A$)
    node(B,$B$)
    node(C,$C$)
    node(D,$A'$)
    node(E,$B_1$)
    node(F,$C$)
    edge(A,B,$alpha$,">->")
    edge(B,C,$beta$,"->>")
    edge(A,D,$g$,"->")
    edge(D,E,$alpha_1$,">->")
    edge(E,F,$beta_1$,"->>")
    edge(B,E,$h$,"->")
    edge(C,F,"=")
  }))
]

#definition[
  Короткие точные последовательности $E_1 : space A >->^(alpha_1) B_1 ->>^(beta_1) C$ и $E_2 : space A >->^(alpha_2) B_2 ->>^(beta_2) C$ называются конгруэнтными ($E_1 ~ E_2$), если существует $h: B_1 -> B_2$ такое, что $h alpha_1 = alpha_2$ и \ $beta_2 h = beta_1$, то есть в следуещей диаграмме оба квадрата коммутативны:
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    let (A,B,C,D,E,F) = ((0,0),(1,0),(2,0),(0,1),(1,1),(2,1))
    node(A,$A$)
    node(B,$B_1$)
    node(C,$C$)
    node(D,$A$)
    node(E,$B_2$)
    node(F,$C$)
    edge(A,B,$alpha_1$,">->")
    edge(B,C,$beta_1$,"->>")
    edge(A,D,"=")
    edge(D,E,$alpha_2$,">->")
    edge(E,F,$beta_2$,"->>")
    edge(B,E,$h$,"-->")
    edge(C,F,"=")
  }))
]

Заметим, что конгруэнтность -- отношение эквивалентности. Действительно, рефлексивность и транзитивность очевидны, а по #link("https://en.wikipedia.org/wiki/Short_five_lemma")[5-лемме] $h$ изоморфизм, откуда следует симметричность.

#definition[
  $epsilon(C,A) := {A >-> B ->> C -"КТП"} slash ~$.
]

В последующих леммах равенства будут пониматься с точностью до конгруэнтности.

#lemma[
  + $(f_1 f_2)^* = f_2^* f_1^*$.
  + $(g_1 g_2)_* = g_(1 *) g_(2 *)$.
]
#proof[
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, {
  let(A1,B1,C1,A2,B2,C2,A3,B3,C3) = ((0,0),(1,0),(2,0),(0,1),(1,1),(2,1),(0,2),(1,2),(2,2))
  node(A1,$A$)
  node(A2,$A$)
  node(A3,$A$)
  node(B1,$B_3$)
  node(B2,$B_2$)
  node(B3,$B_1$)
  node(C1,$C_3$)
  node(C2,$C_2$)
  node(C3,$C_1$)
  edge(A1,A2,"=")
  edge(A2,A3,"=")
  edge(C1,C2,$f_2$,"->")
  edge(C2,C3,$f_1$,"->")
  edge(A1,B1,$alpha_3$,">->")
  edge(A2,B2,$alpha_2$,">->")
  edge(A3,B3,$alpha_1$,">->")
  edge(B1,C1,$beta_3$,"->>")
  edge(B2,C2,$beta_2$,"->>")
  edge(B3,C3,$beta_1$,"->>")
  edge(B1,B2,$h_2$,"->")
  edge(B2,B3,$h_1$,"->")
  let c = 3
  let(A1,B1,C1,A2,B2,C2,A3,B3,C3) = ((0+c,0),(1+c,0),(2+c,0),(0+c,1),(1+c,1),(2+c,1),(0+c,2),(1+c,2),(2+c,2))
  node(A1,$A_3$)
  node(A2,$A_2$)
  node(A3,$A_1$)
  node(B1,$B_3$)
  node(B2,$B_2$)
  node(B3,$B_1$)
  node(C1,$C$)
  node(C2,$C$)
  node(C3,$C$)
  edge(A1,A2,$g_2$,"->")
  edge(A2,A3,$g_1$,"->")
  edge(C1,C2,"=")
  edge(C2,C3,"=")
  edge(A1,B1,$alpha_3$,">->")
  edge(A2,B2,$alpha_2$,">->")
  edge(A3,B3,$alpha_1$,">->")
  edge(B1,C1,$beta_3$,"->>")
  edge(B2,C2,$beta_2$,"->>")
  edge(B3,C3,$beta_1$,"->>")
  edge(B1,B2,$h_2$,"->")
  edge(B2,B3,$h_1$,"->")
  }))
  #comment[непон]
]

#lemma[
  $f^* g_* = g_* f^*$.
]
#proof[
  Рассмотрим короткую точную последовательность $E: space A >->^(alpha) B ->>^(beta) C$. В первой диаграмме ниже правый верхний квадрат это пулбэк, а левый нижний это пушаут.
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    let(A1,B1,C1,A2,B2,C2,A3,B3,C3) = ((0,0),(1,0),(2,0),(0,1),(1,1),(2,1),(0,2),(1,2),(2,2))
    node(A1,$A$)
    node(A2,$A$)
    node(A3,$A_2$)
    node(B1,$B_1$)
    node(B2,$B$)
    node(B3,$B_2$)
    node(C1,$C_1$)
    node(C2,$C$)
    node(C3,$C$)
    node((-0.5,0),$f^* (E):$)
    node((-0.5,1),$E:$)
    node((-0.5,2),$g_* (E):$)
    edge(A1,A2,"=")
    edge(A2,A3,$g$,"->")
    edge(C1,C2,$f$,"->")
    edge(C2,C3,"=")
    edge(A1,B1,$alpha_1$,">->")
    edge(A2,B2,$alpha$,">->")
    edge(A3,B3,$alpha_2$,">->")
    edge(B1,C1,$beta_1$,"->>")
    edge(B2,C2,$beta$,"->>")
    edge(B3,C3,$beta_2$,"->>")
    edge(B1,B2,$h_1$,"->")
    edge(B2,B3,$h_2$,"->")
    let c = 4
    let(X1,X2,X3,Y1,Y2,Y3) = ((0+c,0.5),(1+c,0.5),(2+c,0.5),(0+c,1.5),(1+c,1.5),(2+c,1.5))
    node((-0.5+c,0.5),$f^* (E):$)
    node((-0.5+c,1.5),$g_* (E):$)
    node(X1,$A$)
    node(X2,$B_1$)
    node(X3,$C$)
    node(Y1,$A_2$)
    node(Y2,$B_2$)
    node(Y3,$C_2$)
    edge(X1,X2,$alpha_1$,">->")
    edge(X2,X3,$beta_1$,"->>")
    edge(Y1,Y2,$alpha_2$,">->")
    edge(Y2,Y3,$beta_2$,"->>")
    edge(X1,Y1,$g$,"->")
    edge(X3,Y3,$f$,"->")
  }))
]

#definition[
  $Delta_A : A -> A plus.circle A, quad a |-> (a,a); quad nabla_A : A plus.circle A -> A, quad (a,b) |-> a+b.$
]

#definition[
  Пусть имеются короткие точные последовательности $E_1 : space A >->^(alpha_1) B_1 ->>^(beta_1) C$ и \ $E_2 : space A >->_(alpha_2) B_2 ->>_(beta_2) C$. Тогда суммой Бэра $E_1$ и $E_2$ будем называть $ E_1 + E_2 := Delta^* nabla_* (E_1 plus.circle E_2). $
]
Как мы поняли ранее, это то же самое что $nabla_* Delta^* (E_1 plus.circle E_2)$. Под $E_1 plus.circle E_2$ в этом определении понимается последовательность
#align(center, diagram(cell-size: 7mm, label-size: 3mm, {
  let(A,B,C) = ((0,0),(1,0),(2,0))
  node(A,$A plus.circle A$)
  node(B,$B plus.circle B$)
  node(C,$C plus.circle C$)
  edge(A,B,$mat(alpha_1, 0; 0, alpha_2)$,">->")
  edge(B,C,$mat(beta_1, 0; 0, beta_2)$,"->>")
}))
